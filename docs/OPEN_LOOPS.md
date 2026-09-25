# Open Loops

> งานค้างที่ยังไม่ปิด · ลบแถวเมื่อเสร็จ  
> Owner = `Claude` | `OpenCode` | `human`

Last updated: 2026-09-25 10:17 +07:00

| ID | Task | Owner | Priority | Trigger / due | Notes |
|---|---|---|---|---|---|
| L3 | Commit Lab 00 | human | P0 | Lab 00 D | add เฉพาะไฟล์ตาม Lab · ห้าม `.env` / `.mcp.json` / `settings.local.json` · เลือกได้ว่าจะ add `.claude/agent-memory/` |
| L4 | `src/lib/profile.ts` regex ใช้ flag `m` → `$` จบท้ายบรรทัดแรก · Bio / Interests ถูกตัดเหลือบรรทัดแรก | Claude | P1 | Lab 04 | ยืนยันแล้วใน template 2026-09-25 (บรรทัด 42) |
| L5 | แจ้งวิทยากร: lockfile `hasInstallScript` (better-sqlite3) · `preflight.ps1` encoding · prompt smoke C3 ถาม `@backend` แต่ backend เป็น primary | human | P2 | ก่อน Lab 01 | branch `fix/npm-direct-launcher` มีงานแก้ setup แยกไว้ |

## ปิดแล้ว (ย่อ — ย้ายหรือลบได้เมื่อรก)

| ID | Task | Closed |
|---|---|---|
| L1 | สร้าง STATUS + OPEN_LOOPS จาก example | 2026-09-25 |
| L2 | Consistency check Claude ↔ OpenCode — สรุปตรงกันจากไฟล์ | 2026-09-25 |

## กฎสั้น

- อย่าเก็บงานที่ปิดแล้วจำนวนมากในตารางบน
- เปลี่ยน owner เมื่อ handoff ข้าม harness (ดู `docs/handoffs/`)
- สอง agent ห้ามเป็น writer พร้อมกันบนไฟล์นี้ — single-writer ตาม `AGENTS.md`
