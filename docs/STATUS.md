# Project Status

> อ่านทุก session · **สั้น** · single-writer ต่อรอบ  
> ดู [`COURSE.md`](../COURSE.md) ชั้น State (Hot)

Last updated: 2026-09-25 10:17 +07:00  
Updated by: human (via Claude)

## Current goal

- Lab 00 เสร็จ · พร้อม Lab 01

## Done

- 0: เครื่องมือครบ (node 24 · git · gh · claude native `.exe` · opencode v2 · bun · code) · `gh auth` + `opencode auth` แล้ว
- A: `npm ci --ignore-scripts` · `npm test` 3/3 · `node_modules` ไม่อยู่ใน git
- B: `/init` Claude merge กับ seed · superpowers project scope → `.claude/settings.json` · smoke brainstorming ผ่าน · agents `frontend` / `reviewer` + skills `public-site-safe` / `opencode` · `@frontend` จำข้ามเซสชัน (`.claude/agent-memory/frontend/`)
- C: `/init` OpenCode merge กับ seed · `opencode.json` จาก example (MCP only · native agents) · agent `backend` + skills `public-site-safe` / `claude-code` · resume session จำได้ · เซสชันใหม่ไม่จำแชทแต่ยังเคารพ `AGENTS.md`

## In progress

- D commit (C6 consistency check ผ่าน — Claude กับ OpenCode สรุปตรงกัน)

## Blocked

- —

## Next actions

1. `copy .mcp.json.example .mcp.json` · commit Lab 00 (ส่วน D)
2. Lab 01 — interview → `docs/PROFILE.md`

## Files changed in latest session

- `CLAUDE.md` · `AGENTS.md` (merge /init) · `.claude/settings.json` · `opencode.json` · `.claude/agent-memory/frontend/` · `docs/STATUS.md` · `docs/OPEN_LOOPS.md`

## Notes

- Proposed vs Approved: brainstorm อยู่ใน `DEBATE.md` — สิ่งที่ปิดแล้วอยู่ใน `DECISIONS.md`
- Windows ไม่มี Python: `npm install` ล้มที่ `node-gyp` (lockfile ตั้ง `hasInstallScript` ให้ better-sqlite3) → ใช้ `npm ci --ignore-scripts` (ใช้ prebuild `win32-x64.node`)
- `scripts/preflight.ps1` parse ไม่ผ่านบน PowerShell 5.1 (UTF-8 ไม่มี BOM) → รันผ่าน `[scriptblock]::Create((Get-Content ... -Raw -Encoding UTF8))`
- OpenCode `backend` เป็น `mode: primary` → เรียกด้วย Tab ใน TUI หรือ `opencode run --agent backend` (ไม่ใช่ `@backend`) · model ปัจจุบัน `fireworks/ember-1`
