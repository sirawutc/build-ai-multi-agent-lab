# Decisions — Personal Site

> Lab 02 — **Approved** · ปิดประเด็นจาก [`DEBATE.md`](DEBATE.md) (Brand Strategist · UX Critic · Devil's Advocate) · อ้างอิง `docs/PROFILE.md` ณ `d0e5197`  
> แถวที่ระบุ **human** = คำตัดสินของเจ้าของเว็บ — เป็นข้อยุติ ห้ามเปลี่ยนโดย agent  
> Owner: UI = Claude · `frontend` · API + SQLite = OpenCode · `backend` · docs = Claude

## สรุปการโต้วาที

Brand Strategist เสนอให้เลือกแกนเดียวคือ "Resilience + AI" แยก tagline สั้นออกจาก headline และเขียน Hero/About ให้ผู้บริหาร/IT leader อ่านก่อน UX Critic ชี้ว่า Interests และ Contact ยังไม่พร้อม render เสนอ nav 4 หน้า ให้ CTA หลักเดียวคือ "ติดต่อผม" และย้าย Guestbook ไปเป็นลิงก์รอง Devil's Advocate ท้าทายเรื่องความเจาะจงของเหตุ ransomware, การพูดแทนนายจ้าง, ความเสี่ยงของ Guestbook ที่ไม่มี moderation, PDPA ของฟอร์ม และ scope creep จากบทความใน Nice list ข้อขัดแย้งหลักสามข้อ (CTA หลัก · แกน About · Guestbook) และเรื่อง Bio ถูกปิดโดยเจ้าของเว็บ ส่วนประเด็นที่เหลือปิดตามข้อที่ทั้งสามฝ่ายเห็นตรงกันหรือที่เสี่ยงน้อยที่สุด

## การตัดสินใจ (ตาราง)

| ID | หัวข้อ | ตัดสินใจ | เหตุผลสั้น | ใครเสนอ (Brand/UX/Devil) |
|----|--------|----------|------------|---------------------------|
| D1 | CTA หลัก | ฟอร์ม Contact บนเว็บเป็น CTA หลัก ("ติดต่อผม") · LinkedIn เป็นลิงก์รอง ("ดูโปรไฟล์ LinkedIn ↗") ทุกหน้าที่มี CTA · **human ตัดสิน** | ให้ผู้เยี่ยมอยู่ในเว็บก่อน · ปุ่มเดียวไม่ลังเล | UX (Devil เสนอ LinkedIn ก่อน — ไม่รับ) · owner: UI = Claude `frontend` · `POST /api/contact` = OpenCode `backend` |
| D2 | ข้อความ PDPA + microcopy ฟอร์ม | ใต้ฟอร์มมีข้อความ PDPA 1 บรรทัด: "ข้อมูลที่ส่งใช้เพื่อติดต่อกลับเท่านั้น ไม่แสดงบนเว็บ และไม่ส่งต่อให้ผู้อื่น" · **ห้ามสัญญาเวลาตอบกลับ** — ตัดข้อความ "ปกติตอบภายในไม่กี่วันทำการ" ออก · **human ตัดสิน** | เก็บอีเมลผู้อื่น = ผู้ควบคุมข้อมูล · ยังไม่มี notification จึงสัญญาเวลาไม่ได้ | Devil (R5, R6) · owner: Claude `frontend` |
| D3 | แกน About | **Resilience + AI** — Infra/resilience เป็นราก · AI เป็นทิศทางปัจจุบัน · timeline 3 ช่วง (Infra → System IT/resilience → Dev + AI) แต่ละช่วงจบด้วยบทเรียน · **human ตัดสิน** | จุดตัดที่แตกต่างจากคนสาย AI หรือ Infra ทั่วไป | Brand (Devil เสนอ angle A สำรอง — ไม่รับ) · owner: Claude `frontend` |
| D4 | Guestbook | **เก็บไว้ใน v1** แต่เป็นลิงก์ที่ footer เท่านั้น — ไม่อยู่ nav หลัก ไม่มีการ์ดหน้าแรก · จำกัดความยาว (ชื่อ ≤ 80 · ข้อความ ≤ 500 ตัวอักษร — human ยืนยันตัวเลข) ตรวจทั้ง UI (`maxlength`) และ API · render เป็น text เท่านั้น escape HTML (ห้าม `set:html`) · **human ตัดสิน** | ตาม UX (ลิงก์รอง) + ลดความเสี่ยง R4 ขั้นต่ำ | UX (Devil เสนอตัดทิ้ง — ไม่รับ) · owner: ลิงก์ footer + render = Claude `frontend` · validate ความยาว + insert/list = OpenCode `backend` |
| D5 | Bio บริษัท / ransomware 2022 | **คงเนื้อหา Bio เดิม** (ชื่อบริษัท · ปี 2022 · "ภายในไม่กี่ชั่วโมง" · Origin Connect TH) · แก้เฉพาะย่อหน้าแรก: ระบุว่าผ่าน**บริษัทมหาชนจดทะเบียน 3 แห่ง** — Ananda Development PCL · Origin Property PCL · TPI Polene PCL (ชื่อทางการตรวจกับ SET แล้ว: ANAN · ORI · TPIPL) · ย่อหน้า 2: "SVP" → "Senior Vice President ฝ่าย Information Technology" ตามตำแหน่งบน LinkedIn | เจ้าของยืนยันเนื้อหา และต้องการให้เห็นประสบการณ์ในบริษัทมหาชน 3 แห่ง · ใช้ตัวย่อ PCL ตามรูปแบบบริษัทมหาชนไทย | **human ตัดสิน** (ปฏิเสธข้อเสนอลดความเจาะจงของ Devil R1/R2) · owner: docs = Claude |
| D6 | Headline | **แก้ `## Headline`** เป็น "IT Application Manager ผู้นำทีมพัฒนา Web & Application และขับเคลื่อนธุรกิจด้วยไอทีที่ TPI Polene PCL — 20 ปีจากงาน Infrastructure สู่การพัฒนาระบบและนำ AI มาใช้ในองค์กร" (เดิม: "IT Manager ผู้นำทีม Web App Development ที่ TPI Polene — 20 ปีจากงาน Infrastructure สู่การพัฒนาระบบและนำ AI มาใช้ในองค์กร" · AI เสนอ "ผู้นำไอทีที่สร้างระบบให้พร้อมฟื้นตัวและพร้อมใช้ AI — 20 ปีจากงาน Infrastructure สู่ Web App Development" — ปฏิเสธ) | "Web App Development" อ่านเป็นคำเดียว → แยก Web กับ Application ให้เห็นสองบริบท + เพิ่มบทบาทพัฒนาธุรกิจด้านไอที · คงชื่อบริษัทปัจจุบันตามที่เจ้าของต้องการ · ตำแหน่ง "IT Application Manager" ตรงกับตำแหน่งบน LinkedIn (Manager, Information Technology Application) · **ข้อแลกเปลี่ยน:** headline ยาว (~140 ตัวอักษร) ขัดกับข้อเสนอ Brand ข้อ 2 + UX (อ่านบนมือถือ) — ยอมรับเพื่อความชัดของบทบาท · Lab 04 ตัดแสดงเป็น 2 บรรทัดตรง "—" ได้โดยไม่แก้เนื้อหา | **human ตัดสิน** (ปฏิเสธข้อเสนอตัดชื่อบริษัทของ Brand ข้อ 1 + Devil R3) · owner: docs = Claude |
| D7 | เสียงผู้เขียน (Tone) | **เพิ่ม bullet ใน `## Tone` ของ PROFILE**: ใช้ "ผม" · ประโยคสั้น · คำไทยเป็นหลัก · buzzword อยู่ในการ์ด Interests เท่านั้น · สีคงเดิม (น้ำเงินเข้ม·เทา·ขาว) · ประโยค "ยังสนุกเพราะ AI" เป็นประโยคปิด About · ต้นไม้/โบว์ลิ่ง 1 บรรทัดท้าย About | กรอบ corporate แต่ยังเห็นตัวตน | Brand (ข้อ 3) · owner: docs = Claude · ใช้ใน UI = Claude `frontend` |
| D8 | IA / Nav | Nav 4 หน้า: หน้าแรก · เกี่ยวกับผม · สิ่งที่สนใจ · ติดต่อ · ทุกหน้าจบด้วยทางไปต่อ 1 ทาง · Guestbook ตาม D4 | ไม่ให้ Guestbook แข่งกับ Contact | UX · owner: Claude `frontend` |
| D9 | Contact data บนหน้า | **ไม่แสดงอีเมลบนหน้า** (บรรทัด `email:` ใน PROFILE = form-only ห้าม render) · ช่องทางสาธารณะ = LinkedIn + GitHub เท่านั้น | กัน `demo@example.com` หลุดขึ้น production · สอดคล้อง Brainstorm | UX + Devil (R9) · owner: Claude `frontend` (parser + render) |
| D10 | Interests | 4 การ์ดใช้หัวข้อจาก PROFILE · **agent ห้ามแต่งประโยค "มุมมอง"** แทนเจ้าของ — ถ้ายังไม่มีให้ ship เป็นหัวข้ออย่างเดียว · ถ้าเจ้าของเพิ่มภายหลังใช้รูปแบบ `- หัวข้อ — มุมมอง 1 ประโยค` (frontend แยกด้วย ` — `) | ความคิดที่ไม่ใช่ของเจ้าของ = overclaim | UX (รูปแบบ) + Devil (ห้ามแต่ง) · owner: Claude `frontend` |
| D11 | Footer disclaimer | footer มี "ความเห็นในเว็บนี้เป็นของผมเอง ไม่ใช่ของบริษัทต้นสังกัด" | ไม่ให้เข้าใจว่าพูดแทนบริษัท | UX + Devil (R3) · owner: Claude `frontend` |
| D12 | ฟอร์มก่อน backend เสร็จ | UI แปลผล: 2xx → "ได้รับข้อความแล้ว ขอบคุณครับ" · 400 → "ส่งไม่ได้ — ช่วยเช็กชื่อ อีเมล และข้อความอีกครั้ง" · 501/5xx → "ตอนนี้ฟอร์มยังใช้ไม่ได้ ติดต่อผ่าน LinkedIn ไปก่อนได้เลย" · ห้ามแสดง error ดิบ · ใช้กับ Guestbook ด้วย | API ตอบ 501 จนกว่า Lab 05 | UX · owner: Claude `frontend` · สัญญา JSON `{name,email,message}` / `{name,message}` = OpenCode `backend` |
| D13 | Nice ที่เป็นบทความ | บทเรียน Infra→Dev · AI ได้ผล/ไม่ได้ผล · Resilience mindset → **ย้ายเป็น Later** | ไม่มีต้นฉบับ · ห้าม agent แต่งแทน | Devil (R8) · owner: human (ต้นฉบับ) |

## สิ่งที่เลื่อนออก (Out of scope v1)

- Tagline แยกบรรทัด (parser อ่านแค่ `## Headline` — ถ้าจะเพิ่มต้องตัดสินรูปแบบ PROFILE + parser ใหม่)
- Moderation Guestbook แบบซ่อนจนอนุมัติ (ต้องเพิ่มคอลัมน์ใน schema — งาน OpenCode ถ้าเปิดรอบหน้า) · honeypot / rate limit / ตัด URL
- Notification เมื่อมีข้อความ Contact ใหม่ · นโยบายระยะเวลาเก็บ/ลบอีเมลผู้ติดต่อแบบอัตโนมัติ
- บทความ: Infra→Dev · AI ในองค์กร ได้ผล/ไม่ได้ผล · Resilience mindset (ดู D13)
- Blog/Notes เต็มรูปแบบ + RSS · หน้า Talks / Speaking · ส่วน Off-duty (รูป/โน้ต)
- CMS · login · analytics ละเอียด · หลายภาษา

## เกณฑ์พร้อม Frontend (Lab 04)

- `loadProfile()` อ่าน PROFILE ได้ครบ: Bio 4 ย่อหน้า · Interests 4 ข้อ (ปิด L4 ก่อนหรือเป็นงานแรกของ Lab 04) · Headline ตาม D6
- Nav 4 หน้าตาม D8 · Guestbook เป็นลิงก์ footer เท่านั้น (D4) · footer มี disclaimer (D11) · ไม่มีอีเมลใด ๆ บนหน้า (D9)
- Hero: CTA หลักปุ่มเดียว "ติดต่อผม" + ลิงก์รอง LinkedIn (D1) · About เป็น timeline 3 ช่วงตามแกน Resilience + AI (D3) โดยใช้ Bio เดิม (D5)
- ฟอร์ม Contact มีข้อความ PDPA · ไม่มีคำสัญญาเวลาตอบ (D2) · จัดการ 2xx / 400 / 501 ด้วย microcopy D12 · ฟิลด์ตรงสัญญา `POST /api/contact` `{name, email, message}`
- `npm test` ผ่าน (รวม `tests/public-site.test.ts` — ไม่มีคำพูดถึงคอร์ส/แล็บบนหน้า) · ไม่มีเนื้อหาที่ agent แต่งแทนเจ้าของ (D10)

## บันทึกการแก้ PROFILE (Lab 02)

- `## Headline` — แก้ตาม D6 (human เขียนใหม่ · ข้อความเดิมอยู่ในแถว D6)
- `## Tone` — เพิ่ม bullet "เสียงผู้เขียน" ตาม D7
- `## Bio` — ย่อหน้าแรกระบุบริษัทมหาชน 3 แห่ง + PCL (D5) · เนื้อหาอื่นไม่แก้
- `## Contact` · หัวข้ออื่น — ไม่แก้ (D9 จัดการที่ชั้น render)

## Lab 03 — Issues จาก DECISIONS

| Issue # | Title | มาจาก Decision | Owner · ปิดใน |
|---|---|---|---|
| [#1](https://github.com/sirawutc/build-ai-multi-agent-lab/issues/1) | [D3][D5][D6] Hero + About ตาม PROFILE (Resilience + AI) | D3 · D5 · D6 · D7 (+ แก้ parser L4) | Claude `frontend` · Lab 04 |
| [#2](https://github.com/sirawutc/build-ai-multi-agent-lab/issues/2) | [D8][D9][D11] Nav 4 หน้า · ไม่แสดงอีเมล · footer disclaimer | D8 · D9 · D11 | Claude `frontend` · Lab 04 |
| [#3](https://github.com/sirawutc/build-ai-multi-agent-lab/issues/3) | [D10] การ์ด Interests จาก PROFILE (agent ห้ามแต่งมุมมอง) | D10 | Claude `frontend` · Lab 04 |
| [#4](https://github.com/sirawutc/build-ai-multi-agent-lab/issues/4) | [D1][D2][D12] ฟอร์ม Contact เป็น CTA หลัก + PDPA + microcopy 2xx/400/501 | D1 · D2 · D12 | Claude `frontend` · Lab 04 |
| [#5](https://github.com/sirawutc/build-ai-multi-agent-lab/issues/5) | [D1][D2] Contact API บันทึกลง SQLite + validation | D1 · D2 | OpenCode `backend` · Lab 05 |
| [#6](https://github.com/sirawutc/build-ai-multi-agent-lab/issues/6) | [D4] Guestbook ลิงก์ footer + จำกัด 80/500 + escape HTML | D4 | frontend (Lab 04) + backend (Lab 05) |

#1–#6 สร้างผ่าน **GitHub MCP** (headless `claude -p --allowedTools mcp__github`) · #7 = draft ทดลอง `gh` (ปิดแล้ว · not planned)

## Lab 03 — MCP vs gh

- **ความเร็ว:** `gh issue create` สร้าง + ได้ URL ใน ~3 วินาที (คำสั่งเดียว) · MCP ช้ากว่าเพราะผ่านโมเดล แต่ทำ 6 ใบ + list เช็กซ้ำ + ตาราง ได้ในรอบเดียวจาก prompt
- **สิทธิ์:** `gh` ใช้ OAuth (`gh auth login` · scope `repo`) · MCP ใช้ fine-grained PAT จาก env (`GITHUB_PERSONAL_ACCESS_TOKEN`) — ต้องเลือก repo + ตั้ง **Issues / Pull requests = Read and write** เอง · repo ที่สร้างใหม่ชื่อเดิม = คนละ repo (id ใหม่) ต้องเลือกใหม่ใน PAT
- **Audit trail:** ทั้งคู่ขึ้นเป็น user `sirawutc` บน GitHub · `gh` มีประวัติใน shell · MCP มีบันทึกในแชท/transcript ว่า prompt ไหนสั่ง — แนบ D-id ใน title ช่วยย้อนหาได้ทั้งสองทาง
- **ข้อผิดพลาดที่เจอ:** MCP ได้ `403 Resource not accessible by personal access token` หลายรอบ — PAT ชี้ repo เก่า · แก้สิทธิ์ผิด token · วาง token แล้วบรรทัดใน `.env` ติดกับคอมเมนต์บรรทัดถัดไป · ตรวจก่อนสร้างด้วย POST ว่าง (ได้ 422 = มีสิทธิ์ · 403 = ไม่มี) ไม่ต้องสร้าง issue ทิ้ง
- **เมื่อไหร่ใช้อะไร:** งานหลายใบที่ต้องอ่าน `DECISIONS.md` แล้วแปลงเป็น body/checklist → MCP ในแชท · งานใบเดียว / script ซ้ำได้ / ตรวจผล (`gh issue list`) / ปิด issue → `gh` · MCP ใช้กับงานผลิตเท่านั้น ไม่ใช่ท่อ Claude ↔ OpenCode
