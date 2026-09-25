# Project Status

> อ่านทุก session · **สั้น** · single-writer ต่อรอบ  
> ดู [`COURSE.md`](../COURSE.md) ชั้น State (Hot)

Last updated: 2026-09-25 11:55 +07:00  
Updated by: human (via Claude)

## Current goal

- Lab 03 เสร็จ · Latest D-id = **D13** · Issues #1–#6 (MCP) · ถัดไป Lab 04 (Frontend · issues #1–#4, #6 ฝั่ง UI)

## Done

- Lab 00 (commit `cb4f4ac`): เครื่องมือครบ · `npm ci --ignore-scripts` · `/init` ทั้งสองฝั่ง merge กับ seed · superpowers project scope · agents `frontend` / `reviewer` / `backend` + skills · `@frontend` agent-memory · OpenCode resume · STATUS / OPEN_LOOPS · consistency check · MCP github + playwright connected
- Lab 01: `docs/PROFILE.md` จากสัมภาษณ์ 9 ข้อ (Name / Headline / Bio 4 ย่อหน้า / Audience / Interests 4 ข้อ / Contact `demo@example.com` / Tone Corporate น้ำเงินเข้ม·เทา·ขาว) + `## Brainstorm` (Proposed · Must 4 / Nice 4 / Later 3 · About angle A/B/C · สิ่งที่ต้องเลี่ยง)

- Lab 02: `docs/DEBATE.md` (Brand / UX / Devil) → `docs/DECISIONS.md` D1–D13 · human ตัดสิน D1–D5 (CTA ฟอร์ม + PDPA · แกน Resilience + AI · Guestbook ลิงก์ footer · Bio คงเดิม) · PROFILE แก้ Headline (D6 · human: แยก Web & Application + พัฒนาธุรกิจด้านไอที) + Tone (D7)

- Lab 03: issues #1–#6 ผ่าน GitHub MCP · draft #7 ผ่าน `gh` (ปิดแล้ว) · `## Lab 03` ใน DECISIONS (ตาราง issue + MCP vs gh)

## In progress

- —

## Blocked

- —

## Next actions

1. Lab 04 — frontend ปิด #1 #2 #3 #4 (+ UI ของ #6) · เริ่มจากแก้ parser (L4)
2. ลบ PAT ที่ไม่ใช้ (L10)

## Files changed in latest session

- `docs/DECISIONS.md` (Lab 03) · `docs/STATUS.md` · `docs/OPEN_LOOPS.md` · `.env` (local · PAT ใหม่)

## Notes

- Proposed vs Approved: brainstorm อยู่ใน `DEBATE.md` — สิ่งที่ปิดแล้วอยู่ใน `DECISIONS.md` (`## Brainstorm` ใน PROFILE = Proposed เท่านั้น)
- ความเป็นส่วนตัว (เลือกโดย human 2026-09-25): อีเมลบนเว็บ = `demo@example.com` · Bio ระบุชื่อบริษัท + เหตุ ransomware 2022 ตามร่างเดิม
- `loadProfile()` ตอนนี้ได้ Bio 1 ย่อหน้า / Interests 1 ข้อ เพราะ bug L4 — PROFILE ถูกแล้ว แก้ที่ `profile.ts` ใน Lab 04
- Windows ไม่มี Python: `npm install` ล้มที่ `node-gyp` (lockfile ตั้ง `hasInstallScript` ให้ better-sqlite3) → ใช้ `npm ci --ignore-scripts` (ใช้ prebuild `win32-x64.node`)
- `scripts/preflight.ps1` parse ไม่ผ่านบน PowerShell 5.1 (UTF-8 ไม่มี BOM) → รันผ่าน `[scriptblock]::Create((Get-Content ... -Raw -Encoding UTF8))`
- OpenCode `backend` เป็น `mode: primary` → เรียกด้วย Tab ใน TUI หรือ `opencode run --agent backend` (ไม่ใช่ `@backend`) · model ปัจจุบัน `fireworks/ember-1`
