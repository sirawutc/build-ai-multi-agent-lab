# Open Loops

> งานค้างที่ยังไม่ปิด · ลบแถวเมื่อเสร็จ  
> Owner = `Claude` | `OpenCode` | `human`

Last updated: 2026-09-25 10:30 +07:00

| ID | Task | Owner | Priority | Trigger / due | Notes |
|---|---|---|---|---|---|
| L4 | `src/lib/profile.ts` regex ใช้ flag `m` → `$` จบท้ายบรรทัดแรก · Bio / Interests ถูกตัดเหลือบรรทัดแรก | Claude | P1 | Lab 04 | ยืนยันกับ PROFILE จริง 2026-09-25: Bio 4→1 ย่อหน้า · Interests 4→1 ข้อ (บรรทัด 42) |
| L5 | แจ้งวิทยากร: lockfile `hasInstallScript` (better-sqlite3) · `preflight.ps1` encoding · prompt smoke C3 ถาม `@backend` แต่ backend เป็น primary | human | P2 | ก่อน Lab 02 | branch `fix/npm-direct-launcher` มีงานแก้ setup แยกไว้ |
| L6 | Guestbook เป็น Must หรือ Nice | human | P2 | Lab 02 | Brainstorm เสนอ Nice (moderation + จำกัดความยาว) · ถกใน `DEBATE.md` |
| L7 | รูปโปรไฟล์สำหรับหน้าเว็บ | human | P2 | Lab 04 | เตรียมรูปของตัวเอง (ไม่ใช้รูปจากเว็บอื่น) |

## ปิดแล้ว (ย่อ — ย้ายหรือลบได้เมื่อรก)

| ID | Task | Closed |
|---|---|---|
| L1 | สร้าง STATUS + OPEN_LOOPS จาก example | 2026-09-25 |
| L2 | Consistency check Claude ↔ OpenCode — สรุปตรงกันจากไฟล์ | 2026-09-25 |
| L3 | Commit Lab 00 (`cb4f4ac` · pushed) | 2026-09-25 |

## กฎสั้น

- อย่าเก็บงานที่ปิดแล้วจำนวนมากในตารางบน
- เปลี่ยน owner เมื่อ handoff ข้าม harness (ดู `docs/handoffs/`)
- สอง agent ห้ามเป็น writer พร้อมกันบนไฟล์นี้ — single-writer ตาม `AGENTS.md`
