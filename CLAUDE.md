# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

@AGENTS.md

# Claude Code — seed คอร์ส (อย่าลบตอน /init)

หลัง Lab 00 ให้ `/init` **merge** — เก็บกฎด้านล่างไว้เสมอ

## สี่เสา (ย่อ)

1. Multi-Agent แยกหน้าที่/ความจำ · 2. Sub-Agent ใช้แล้วทิ้ง · 3. ประสานผ่าน docs/PR · 4. Swarm เพดาน **20 turns**

## Ownership (บังคับ)

| Artifact | Owner |
|---|---|
| UI | Claude · `.claude/agents/frontend.md` |
| API + SQLite | OpenCode · `.opencode/agents/backend.md` |
| docs PROFILE / DEBATE / DECISIONS | Claude (Lab 01–02) |
| Hot state STATUS / OPEN_LOOPS | ผู้ถืองานรอบนั้น (single-writer) |

## Canonical context (อ่านก่อน · อย่าคัดลอกซ้ำในไฟล์นี้)

ก่อนลงมือ:

1. `docs/STATUS.md`
2. `docs/OPEN_LOOPS.md`
3. handoff ล่าสุดใน `docs/handoffs/` (ถ้ามี)
4. ตามงาน: `docs/PROFILE.md` · `docs/DECISIONS.md`

สรุป Goal / Latest D-id / Open loops / Blockers **ไม่เกิน 8 บรรทัด**  
ห้ามสมมุติจากแชท OpenCode ถ้าไม่มีใน `docs/`  
จบงานที่เปลี่ยนสถานะ → อัปเดต STATUS / OPEN_LOOPS · สลับ harness → เขียน handoff จาก [`docs/handoffs/TEMPLATE.md`](docs/handoffs/TEMPLATE.md)

## กฎสั้น

- Root เท่านั้น · plugin **project scope**
- Skill **`public-site-safe`**
- Agent ถาวรใช้ `memory: project` (harness) — ตรวจใน Lab 00 · ห้ามสร้าง memory bus เอง
- MCP ไม่ใช่ท่อ Claude ↔ OpenCode · Cross-CLI เฉพาะ Lab 07
- ห้าม commit `.env` · PR เข้า learner repo เท่านั้น
- Swarm: หยุดเมื่อ done หรือครบ 20 turns
- STATUS/OPEN_LOOPS = single-writer · commit ก่อนสลับ harness

## รันเทสต์เดี่ยว (คำสั่งหลักดู AGENTS.md)

```powershell
npx vitest run tests/smoke.test.ts         # ไฟล์เดียว · เพิ่ม -t "<ชื่อ it>" เพื่อรันเคสเดียว
npx vitest run --config vitest.labs.config.ts tests/labs/lab05-api.test.ts   # lab test ต้องระบุ config
npx playwright test playwright/smoke.spec.ts -g "<ชื่อ test>"
```

ไม่มี linter ตั้งไว้

## สถาปัตยกรรม (ภาพรวม)

- **Astro SSR** (`output: 'server'`, `@astrojs/node` standalone, port 4321) — ไม่มี static prerender สำหรับ API
- **Profile pipeline:** `docs/PROFILE.md` (Lab 01 เขียน) → `src/lib/profile.ts` `loadProfile()` parse หัวข้อ `## Name` / `## Headline` / `## Bio` / `## Audience` / `## Interests` (bullet list) → หน้า `.astro` ใช้ render · หัวข้อหาย/ว่าง → `FALLBACK` (ต้องไม่มีคำพูดถึงคอร์ส) · เปลี่ยนชื่อหัวข้อใน PROFILE.md = หน้าเว็บพัง
- **Persistence:** `src/lib/db.ts` — ตาราง `contact_messages`, `guestbook` · `insertContact` / `listGuestbook` / `insertGuestbook` เป็น stub โยน `NOT_IMPLEMENTED…` (งาน Lab 05 ฝั่ง OpenCode)
- **API routes** (`src/pages/api/*.ts`, `prerender = false`) เรียก helper ใน `db.ts` · error ที่ขึ้นต้น `NOT_IMPLEMENTED` → 501, อื่นๆ → 400 · สัญญา JSON ที่ฟอร์ม UI ยิงต้องตรงกับ route เหล่านี้
- **UI:** `src/layouts/BaseLayout.astro` (CSS variables ใน `:root`, `lang="th"`) + `src/pages/*.astro`
- **Guard test สำคัญ:** `tests/public-site.test.ts` สแกน markup ใน `src/**/*.astro|html` (ตัด frontmatter + HTML comment) — ห้ามมีข้อความแบบ `lab 04` / `แล็บ` ที่ผู้เข้าชมเห็น · คอมเมนต์ใน `.ts` พูดถึง lab ได้
- `.github/course-issues/*.md` = ต้นฉบับ issue ที่ `scripts/create-course-issues.mjs` สร้าง
- Windows setup: `scripts/setup-windows.ps1`, `scripts/preflight.ps1` · Deploy = Docker (`Dockerfile`) บน Coolify

## Labs

ดู [`labs/README.md`](labs/README.md) · เริ่ม [`lab-00-project-init`](labs/lab-00-project-init/README.md)
