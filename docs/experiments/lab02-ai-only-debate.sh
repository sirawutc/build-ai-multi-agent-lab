#!/usr/bin/env bash
# AI-only multi-round debate. Each turn = fresh one-shot claude session, Read-only tools.
# The orchestrator (this script) appends each answer to the debate file.
set -u
cd "$(git rev-parse --show-toplevel)"
CLAUDE="${CLAUDE:-claude}"
PROFILE=docs/experiments/_input-profile.md   # input = PROFILE ก่อนดีเบต (Lab 01)
DEBATE=docs/experiments/lab02-ai-only-debate.md
DECISIONS=docs/experiments/lab02-ai-only-decisions.md
MAX_ROUNDS=4
LOG="$TEMP/ai-debate.log"; : > "$LOG"
git show d0e5197:docs/PROFILE.md > "$PROFILE"   # d0e5197 = commit Lab 01 ของ repo นี้ · repo อื่นให้เปลี่ยนเป็น commit ของตัวเอง

COMMON="กติกาเด็ดขาด:
- อ่านได้เฉพาะ $PROFILE และ $DEBATE (ถ้ามี) — ห้ามอ่าน docs/DEBATE.md, docs/DECISIONS.md, docs/PROFILE.md, docs/STATUS.md, docs/OPEN_LOOPS.md หรือไฟล์ใน src/ (เป็นผลของอีกการทดลอง ห้ามให้มีอิทธิพล)
- ห้ามแก้ไฟล์ใด ๆ — ตอบเป็น markdown ภาษาไทยทาง stdout เท่านั้น (ผู้ประสานงานจะบันทึกให้)
- ไม่มีมนุษย์ตัดสิน — ต้องเถียงด้วยเหตุผลเอง ห้ามถามกลับ ห้ามอ้างว่า 'รอเจ้าของตัดสิน'
- ห้ามใส่ความลับ · ห้ามเขียนโค้ด"

ROLE_Brand="Brand Strategist — positioning, headline/tagline, audience, โทนข้อความ"
ROLE_UX="UX Critic — IA ของเว็บ 4 หน้า (Home/About/Interests/Contact), CTA, microcopy, อ่านง่ายบนมือถือ"
ROLE_Devil="Devil's Advocate — privacy, credibility/overclaim, NDA/นายจ้าง, spam, PDPA, scope creep"

run() { # $1=label  stdin=prompt
  local out; out=$("$CLAUDE" -p --allowedTools "Read" --output-format text 2>>"$LOG")
  local rc=$?
  if [ $rc -ne 0 ] || [ -z "$out" ]; then echo "[FAIL] $1 rc=$rc" | tee -a "$LOG"; return 1; fi
  printf '%s' "$out"
}

printf '# AI-only Debate — Personal Site (experiment)\n\n> ไม่มีมนุษย์ตัดสิน · input = PROFILE จาก Lab 01 (d0e5197) · แต่ละ turn = เซสชัน claude -p แยก (Read-only)\n\n' > "$DEBATE"

rounds_done=0
for r in $(seq 1 $MAX_ROUNDS); do
  printf '\n## รอบ %s\n' "$r" >> "$DEBATE"
  agree=0
  for who in Brand UX Devil; do
    role_var="ROLE_$who"; role="${!role_var}"
    if [ "$r" -eq 1 ]; then
      task="รอบที่ 1: อ่าน $PROFILE แล้วเสนอมุมของคุณ 5–8 bullet พร้อมข้อเสนอที่ชัด (เลือกข้าง ไม่กลาง ๆ) ในหัวข้อที่เกี่ยว: CTA หลัก, แกนเล่าเรื่อง About, Guestbook ใน v1, ความเจาะจงของ Bio (ชื่อบริษัท/ransomware 2022/Origin Connect TH), Headline, อีเมลบนเว็บ"
    else
      task="รอบที่ $r: อ่าน $DEBATE ทั้งไฟล์ ตอบโต้ข้อเสนอของอีกสองบทบาทโดยตรง (อ้างชื่อบทบาท) — ยอมรับข้อที่ถูกโน้มน้าว, ยืนยันพร้อมเหตุผลใหม่ข้อที่ยังค้าน, เสนอทางประนีประนอมถ้ามี · อย่าทวนของเดิม · สั้น 4–8 bullet"
    fi
    prompt="คุณคือ $role
$task

$COMMON

บรรทัดสุดท้ายของคำตอบต้องเป็นอย่างใดอย่างหนึ่งเท่านั้น:
STANCE: AGREE   (ถ้าคุณยอมรับข้อสรุปรวมที่กำลังเกิดขึ้นได้ ไม่มีข้อค้านสำคัญใหม่)
STANCE: OBJECT  (ถ้ายังมีข้อค้านสำคัญ)"
    echo "== round $r · $who" | tee -a "$LOG"
    ans=$(printf '%s' "$prompt" | run "r$r-$who") || exit 1
    printf '\n### %s (รอบ %s)\n\n%s\n' "$who" "$r" "$ans" >> "$DEBATE"
    stance=$(printf '%s' "$ans" | grep -oE 'STANCE: (AGREE|OBJECT)' | tail -1)
    echo "   $stance" | tee -a "$LOG"
    [ "$stance" = "STANCE: AGREE" ] && agree=$((agree+1))
  done
  rounds_done=$r
  echo "round $r: agree=$agree/3" | tee -a "$LOG"
  if [ "$r" -ge 2 ] && [ "$agree" -eq 3 ]; then echo "converged at round $r" | tee -a "$LOG"; break; fi
done

echo "== synthesize" | tee -a "$LOG"
syn="คุณคือ facilitator ที่เป็นกลาง (AI) — ไม่มีมนุษย์ตัดสิน คุณต้องตัดสินเองจากน้ำหนักเหตุผลในการถก
อ่าน $PROFILE และ $DEBATE ทั้งไฟล์ (ถก $rounds_done รอบ)

$COMMON

เขียน markdown:
# AI-only Decisions — Personal Site (experiment)
## สรุปการถก (3–5 ประโยค · มีกี่รอบ · ใครเปลี่ยนใจเรื่องไหน)
## การตัดสินใจ
| ID | หัวข้อ | ตัดสิน | เหตุผลสั้น | ชนะเพราะมุมไหน | ฉันทามติ? (ทั้ง 3 / 2 ต่อ 1 / facilitator ชี้ขาด) |
(อย่างน้อย 6 แถว AI1–AI6+ ครอบคลุม: CTA หลัก, แกน About, Guestbook v1, Bio บริษัท/ransomware, Headline, อีเมลบนเว็บ)
## ข้อที่ยังเห็นต่าง (ถ้ามี)
## Out of scope v1
## เกณฑ์พร้อม Frontend (3–5 bullet)"
ans=$(printf '%s' "$syn" | run synth) || exit 1
printf '%s\n' "$ans" > "$DECISIONS"
echo "DONE rounds=$rounds_done" | tee -a "$LOG"
