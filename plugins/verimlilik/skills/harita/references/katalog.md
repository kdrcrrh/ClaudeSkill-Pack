# Katalog — kurulu skill ve plugin'lerin ayrıntısı

Her satır: ne yapar · gereksinim · nasıl kurulur · örnek istem (TR / EN).

## 🎨 Tasarım
- **design-taste-frontend** (Leonxlnx/taste-skill) — "Yapay zekâ yapmış gibi" görünmeyen kurumsal web siteleri; tarayıcıda kontrol eder. Gereksinim: Node 22+, Chrome/Edge. Kurulum: `~/.claude/skills/design-taste-frontend`. Not: iş bitince yerel `gate.mjs` kontrolü çalışır.
  "Diş kliniği için tek sayfalık site yap" / "Build a landing page for a dental clinic"
- **awwwards** (juliobsz/skills) — Tek cümlelik istekten ödül kalitesinde site: konsept, sanat yönetimi, tipografi, animasyon, WebGL, sayfa geçişleri; sonra gerçek tarayıcıda görsel kontrol. Next.js (varsayılan) veya Astro. Gereksinim: Node 20+, projede Playwright. Kurulum: `~/.claude/skills/awwwards`.
  "Bana portfolyo yap, adım Ayşe" / "Make me a portfolio, my name is Julio"
- **jury** (juliobsz/skills) — Herhangi bir siteyi Awwwards jürisi gibi puanlar: masaüstü/telefon ekran görüntüleri, LCP/CLS/FPS, erişilebilirlik (axe), SEO; kodu görmeyen bir eleştirmen puan verir ve sıralı düzeltme listesi çıkarır. Siteyi değiştirmez. Gereksinim: Node 20+, Playwright. Kurulum: `~/.claude/skills/jury`.
  "Bu siteyi puanla: example.com" / "Score this site like an Awwwards jury"
- **frontend-design** (Anthropic) — Arayüzde estetik yön, tipografi, şablon dışı tercihler. Gereksinim yok.
  "Bu paneli daha özgün göster" / "Make this dashboard look less generic"
- **ui-ux-pro-max** (nextlevelbuilder) — 80 stil, 192 palet, 74 font eşleşmesi, UX kuralları; yerel Python arama script'i. Gereksinim: Python.
  "Fintech mobil uygulaması için tasarım sistemi öner" / "Suggest a design system for a fintech app"
- **canvas-design** (Anthropic) — PNG/PDF poster ve sanat eseri. Telefonda çalışır.
  "Minimal bir caz konseri posteri" / "Minimal jazz concert poster"
- **algorithmic-art** (Anthropic) — p5.js ile generatif sanat.
- **theme-factory** (Anthropic) — 10 hazır tema veya anlık tema; sunum, doküman, HTML'e uygulanır.
- **brand-guidelines** (Anthropic) — Anthropic marka renkleri; kendi markan için skill-creator ile kopyası yapılabilir.

## 🎬 Video & Ses (yalnızca bilgisayar)
- **ghost-editor** (kurbaitaev) — Telefonla çekilmiş konuşan kafa videosundan dikey reel: en iyi tekrarlar, duraklama kesme, kelime zamanlı altyazı, efekt, B-roll. Gereksinim: ffmpeg, Python, Node; bazı adımlar bash ister (Git Bash). Windows'ta ilk kullanımda test edilmeli.
  "Bu videoyu reel yap, altyazı ekle" / "Turn this recording into a reel with captions"
- **shorts** (AgriciDaniel/claude-shorts) — Uzun videodan viral kısa klipler; faster-whisper + Remotion + ffmpeg. Gereksinim: Python, Node, ffmpeg (GPU opsiyonel).
  "Bu 1 saatlik podcastten 5 short çıkar" / "Extract 5 shorts from this podcast"
- **hyperframes**, **hyperframes-cli**, **hyperframes-registry** (HeyGen) — HTML'i videoya render eder; ~450 hazır blok (geçiş, başlık, grafik, harita). Gereksinim: Node.
  "Ürünüm için 30 sn tanıtım videosu" / "30-second product launch video"
- **remotion-best-practices / -create / -render / -captions** (Remotion) — React ile programatik video. Gereksinim: Node. Lisans: Remotion şirketler için ücretli olabilir. Claude Haritası paketlerine dahil değildir; kaynağından kurulur: https://github.com/remotion-dev/skills
- **ffmpeg** — Kesme, birleştirme, format dönüştürme, ses ayırma; skill gerekmez, doğrudan iste.

## ✍️ Yazı & İçerik (telefonda da çalışır)
- **content-research-writer** (ComposioHQ) — Araştırma, kaynak, kanca, taslak geri bildirimi. Claude Haritası paketlerine dahil değildir; kaynağından kurulur: https://github.com/ComposioHQ/awesome-claude-skills
- **voice-dna** (bizim) — Yazı örneklerinden üslup profili çıkarır, o sesle yazar.
  "Şu 5 postuma bakıp benim tarzımda yeni post yaz" / "Write like me based on these posts"
- **humanizer** (blader, plugin) — Yapay zekâ izlerini temizler, anlamı korur.
- **prompt-master** (bizim) — Rol + Bağlam + Görev + Kısıt + Format formülüyle prompt üretir; görsel/video modeli ipuçları.

## 💻 Kodlama
- **Superpowers** (obra, plugin, 15 skill) — brainstorming → plan → TDD → debugging → code review → branch bitirme.
- **karpathy-guidelines** — Basit tut, cerrahi değişiklik, varsayımları söyle, doğrulanabilir hedef.
- **claude-code-setup** (Anthropic, plugin) — Projeyi tarar, hook/skill/MCP/agent önerir.
- **playwright** (Microsoft, plugin) — Tarayıcıyı otomatik kullanır, ekran görüntüsü, form, test. Gereksinim: Node; uygulama yeniden başlatılmalı.
- Yerleşik: `code-review`, `simplify`, `security-review`, `init` (CLAUDE.md), `run`.

## 📄 Belge & Veri (Claude'un hazır yetenekleri)
- `anthropic-skills:pdf`, `docx`, `xlsx`, `pptx`, `docs` — dosya oluşturma/düzenleme.
- `data:*` — analiz, SQL, grafik, dashboard, istatistik. `dataviz` — grafik tasarım kuralları.
- `anthropic-skills:deep-research` — çok kaynaklı araştırma raporu.
- **markitdown** (bu repo için yazıldı; Microsoft MarkItDown'u çağırır) — PDF/Word/Excel/PowerPoint/HTML/EPUB → Markdown, sonra yalnızca gereken bölümü okur; token tasarrufu sağlar. Gereksinim: Python 3.10+ ve `pip install "markitdown[all]"` (skill eksikse kurulumu önerir). Kurulum: `~/.claude/skills/markitdown`.
  "Bu 200 sayfalık raporu özetle" / "Summarise this 200-page PDF"

## ⚡ Verimlilik
- **find-skills** (Vercel) — `npx skills find <konu>` ile yeni skill arar.
- **skill-creator** (Anthropic) — Kendi skill'ini yaz, test et, açıklamasını iyileştir.
- **harita** (bu skill) — Doğru aracı seçer.
- Yerleşik: `schedule`, `loop`, `update-config`, `explain-usage`.

## 🤖 Ajanlar (alt ajanlar, yalnızca Claude Code)
- **The Agency** (msitarzewski/agency-agents) — 283 uzman kişilik: tasarım, yazılım, pazarlama, ücretli reklam, satış, ürün, proje yönetimi, test, güvenlik, finans, sağlık, akademik, CBS, destek ve özel alanlar. Skill değil alt ajandır; Claude işi ilgili ajana devreder. Gereksinim yok. Kurulum: `~/.claude/agents/*.md` (`bash kur.sh ajanlar`). Dosya adı bölümle başlar: `design-*`, `engineering-*`, `marketing-*`, `sales-*`, `testing-*`, `security-*`…
  "Backend Architect ajanıyla API tasarla" / "Use the Reality Checker agent to review this launch"

## Telefona / claude.ai'ye kurulum
1. Skill klasörünü ZIP yap (klasörün kendisi ZIP'in kökünde olmalı, içinde SKILL.md).
2. claude.ai → Customize → Skills → Upload (veya "+" / "Add skill").
3. Ayarlarda "Code execution and file creation" açık olmalı.
Plugin'ler (Superpowers, Humanizer vb.) claude.ai plugin dizininden eklenir, hesapla senkron olur.

## Kurulu olmayan ama sorulabilecekler (envanterde 🟡)
claude-mem (hafıza), Caveman (kısa cevap/token), Lemo-OpusCar, Graphify, marketingskills,
last30days, obsidian-skills, Figma/Supabase/Vercel bağlantıları. İstenirse önce kodu incele, sonra kur.
