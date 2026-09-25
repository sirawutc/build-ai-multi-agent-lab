# Agents — Build AI Multi-Agent Lab (V4) · seed

กติการ่วมสำหรับ **Claude Code** และ **OpenCode**  
สินค้า = เว็บ personal branding (Astro) ใน root นี้

หลัง Lab 00: `/init` แล้ว **merge** — อย่าลบ Ownership / สี่เสา / Native harness

## สี่เสาหลัก

1. **Multi-Agent** — หน้าที่และความจำแยก (ไฟล์ใน `.claude/agents/`, `.opencode/agents/` + คนละ CLI)  
2. **Sub-Agent** — spawn ใช้แล้วทิ้ง; สิ่งที่ต้องจำต่อ = เขียนลง `docs/` เท่านั้น  
3. **การประสานงาน** — handoff ผ่าน docs / issues / PR / review สำคัญกว่าแชทเดียว  
4. **Swarm** — หลายตัวได้; **เพดาน 20 turns** แล้วหยุดสรุปช่องว่าง (Lab 05b)

ใช้ skill **`public-site-safe`** ทุกงาน implement / swarm / ship

## สี่ชั้นความรู้ (อ่านก่อนลงมือ)

| ชั้น | ไฟล์หลัก |
|---|---|
| Rules | ไฟล์นี้ · `CLAUDE.md` · skill `public-site-safe` |
| Context | `COURSE.md` · `docs/PROFILE.md` · `docs/DECISIONS.md` (Lab 02 สร้าง) |
| State (Hot) | `docs/STATUS.md` · `docs/OPEN_LOOPS.md` |
| Artifacts | `src/` · tests · `docs/QA.md` · PR |

**Hot / Warm / Cold:** Hot = STATUS + OPEN_LOOPS + handoff ล่าสุด · Warm = PROFILE/DECISIONS/Ownership · Cold = `_cli-*` / logs เก่า  
**Proposed vs Approved:** `DEBATE.md` = ยังไม่ปิด · `DECISIONS.md` = อนุมัติแล้วเท่านั้น  
**Seed state:** repo ที่ clone สดยังไม่มี `STATUS.md` / `OPEN_LOOPS.md` (มีแค่ `docs/*.md.example` — Lab 00 C6 คัดลอก) · `DECISIONS.md` / `DEBATE.md` เกิดใน Lab 02

### Start-of-session (≤ 8 บรรทัด)

ก่อนเริ่มงานทุกครั้ง:

1. อ่าน `docs/STATUS.md` และ `docs/OPEN_LOOPS.md` (ถ้ายังไม่มี — seed ใหม่ ให้คัดลอกจาก `*.md.example` ก่อน)
2. ถ้ามี handoff ล่าสุดใน `docs/handoffs/` ที่ส่งถึงคุณ — อ่านด้วย
3. สรุปให้คนดู: Current goal · Latest D-id (ถ้ามี) · Open loops · Blockers — **ไม่เกิน 8 บรรทัด**
4. ถ้าข้อมูลขัดแย้งระหว่างไฟล์ — หยุดวิเคราะห์ก่อนแก้โค้ด
5. **ห้าม**สมมุติว่าคุณรู้สิ่งที่เกิดในแชทของ CLI อีกฝั่ง ถ้าไม่มีเขียนใน `docs/`

จบงานที่เปลี่ยนสถานะ: อัปเดต `STATUS.md` / `OPEN_LOOPS.md` (และ handoff ถ้าสลับ harness)

### Single-writer (ไฟล์ร่วมมีคนเขียนคนเดียวต่อรอบ)

- `docs/STATUS.md` และ `docs/OPEN_LOOPS.md` มี **writer คนเดียวต่อรอบ** — สลับ Claude ↔ OpenCode หลัง commit หรือหลังเขียน handoff
- Ownership โค้ดตามตารางด้านล่าง — reviewer อ่านอย่างเดียวจนกว่าจะโอนงานชัดใน handoff
- อย่าให้สอง agent แก้ไฟล์เดียวกันพร้อมกันโดยไม่แยก branch

## Ownership

| Artifact | Owner |
|---|---|
| UI (`src/pages/*.astro`, `src/layouts/`, styles) | Claude · agent `frontend` |
| API + SQLite (`src/lib/db.ts`, `src/pages/api/*`) | OpenCode · agent `backend` |
| E2E / a11y (`docs/QA.md`) | Playwright MCP + either CLI |
| Profile / debate docs | Claude (Lab 01–02 · subagents) |
| Hot state (`STATUS.md` · `OPEN_LOOPS.md`) | ผู้ถืองานรอบนั้น (single-writer) |
| Handoffs (`docs/handoffs/`) | ผู้ส่งงานก่อนสลับ harness |
| Review artifacts | Lab 07 · agent `reviewer` (Claude) / OpenCode review |
| Ship (`docs/SHIP.md`) | Lab 08 |

## ความจำ

| ชนิด | อยู่ที่ | ตัวอย่าง |
|---|---|---|
| ร่วม (shared) | `docs/`, git, PR | STATUS, OPEN_LOOPS, PROFILE, DECISIONS, QA, handoffs |
| แยก (agent-local) | เซสชัน + ไฟล์ agent | frontend ไม่ถือ context backend |
| **Harness persistent** | Claude / OpenCode native | ดูตารางด้านล่าง — **ห้ามสร้าง memory bus เอง — ใช้ของที่ harness มีให้** |
| ทิ้งได้ | Sub-Agent รอบเดียว | Brand/UX/Devil หลังจบ Lab 02 |

### Harness persistent memory (ตรวจใน Lab 00)

| เครื่องมือ | ใช้ของอะไร | ตรวจยังไง |
|---|---|---|
| Claude Code | `memory: project` บน agent → `.claude/agent-memory/<name>/` · auto memory ผ่าน `/memory` | จำข้ามเซสชัน + มีไฟล์ MEMORY |
| OpenCode | `AGENTS.md` + agent file + **resume session** | resume เห็นบริบท · เซสชันใหม่ไม่บังคับ recall ปากเปล่า |

ความจำร่วมของคอร์ส (`docs/`) คนละชั้นกับ harness memory — สิ่งที่ต้องโชว์ข้ามคน/CLI ให้เขียนลง docs  
Adapter (ไฟล์กติกาที่แต่ละ CLI อ่าน — `AGENTS.md` / `CLAUDE.md`) ต้อง**ชี้ไป**ไฟล์กลาง — อย่าคัดลอกเนื้อหา STATUS/DECISIONS ซ้ำใน adapter

## Workflow

```text
00 Init → 01 Interview → 02 Debate → 03 Issues → 04 FE → 05 BE → 05b Swarm(≤20) → 06 QA → 07 Review → 08 Ship
```

## Native harness only

harness = ความสามารถถาวรที่ Claude Code / OpenCode มีให้ในตัว (memory, plugin, session) — ใช้ของเดิม ไม่สร้างชั้นเอง

- Plugins project scope: superpowers (oh-my-openagent ยังไม่รองรับ OpenCode v2 — ใช้ native agents)  
- **Call ข้าม harness ทำได้** — แต่ละตัวยังรันบน harness ตนเอง: ฝั่ง OpenCode เรียก `claude -p` · ฝั่ง Claude เรียก `opencode run` (headless one-shot · ท่อ = ไฟล์ใน `docs/`)  
- **กติกา call:** ฝั่งที่ถูกเรียกเขียนได้**เฉพาะไฟล์รายงาน**ที่ prompt ระบุ (เช่น `docs/review-*.md`) — ห้ามแตะไฟล์ ownership ของผู้เรียก · อย่าให้สอง harness เขียน working tree พร้อมกัน (commit ก่อน)  
- ห้ามสร้างระบบส่งข้อความ/สถานะระหว่าง CLI เอง (เช่น ใช้ไฟล์ JSON เป็นท่อส่งงาน) · ห้าม daemon/loop ถาวร  
- MCP = งานผลิต — **ไม่ใช่**ท่อระหว่างสอง CLI  
- Swarm หยุดเมื่อ done **หรือ** ครบ **20 turns**

## คำสั่งหลัก + จุดที่เดาผิดกันง่าย

```powershell
npm install              # Node >= 22.12 (enforce ใน package.json)
npm run dev              # astro dev — http://127.0.0.1:4321 (HOST/PORT จาก .env)
npm test                 # Vitest tests/** — ไม่รวม tests/labs (CI รันชุดนี้ + build)
npm run test:labs        # เฉพาะ tests/labs — ต้อง RED จนถึง Lab 05 (stubs ใน db.ts โยน NOT_IMPLEMENTED ตั้งใจ — อย่า "แก้" ล่วงหน้า)
npm run test:e2e         # Playwright (โฟลเดอร์ playwright/) — ไม่มี webServer: ต้องรัน npm run dev ค้างไว้ก่อน หรือตั้ง PLAYWRIGHT_BASE_URL
npm run build && npm start
node scripts/create-course-issues.mjs
powershell scripts/preflight.ps1   # ตรวจเครื่องมือ + ไฟล์ template ครบ
```

- ตาราง SQLite (`site.sqlite`) สร้างเองที่ `DATA_DIR` (default `./data/`, gitignored) ครั้งแรกที่ `getDb()` ถูกเรียก — ไม่ต้อง migration script
- Config ทุกตัวเป็น `.example` — Lab 00 คัดลอก: `opencode.json.example` → `opencode.json` · `.mcp.json.example` → `.mcp.json` · `.claude/settings.json.example` → `.claude/settings.json` (`.gitignore` ignore เฉพาะ `.mcp.json` — `opencode.json` และ `.claude/settings.json` ต้อง commit ตาม Lab 00 ส่วน D)
- `.env`: copy จาก `.env.example` (`STUDENT_SLUG`, `SITE_URL`, `GITHUB_PERSONAL_ACCESS_TOKEN`) — ห้าม commit
- CI (`.github/workflows/ci.yml`): `npm ci` → `npm test` → `npm run build` — **ไม่**รัน test:labs / e2e ใน CI
- Env placeholder syntax ต่างกัน: `opencode.json` ใช้ `{env:VAR}` · `.mcp.json` ใช้ `${VAR}` — อย่าลอกสลับ

## ห้าม

- Commit `.env`, PAT, Coolify webhook, `node_modules`
- เคลม deploy สำเร็จโดยไม่มี URL 200 จริง
- บังคับ tmux บน Windows
- PR เข้า `Onto-IQ/*` — เข้า learner repo เท่านั้น
- ปล่อย swarm เกิน 20 turns โดยไม่สรุปหยุด

## Labs

[`SETUP.md`](./SETUP.md) → [`labs/lab-00-project-init`](./labs/lab-00-project-init/README.md) → [`labs/README.md`](./labs/README.md)
