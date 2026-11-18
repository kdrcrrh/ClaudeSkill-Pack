---
name: harita
description: Skill haritası / skill router. Kullanıcının isteğine en uygun kurulu skill, plugin veya Claude yeteneğini bulur, kısaca söyler ve onu devreye sokar. Use when the user asks "hangi skill", "hangi araç", "ne kullanayım", "harita", "neler yapabilirsin", "skill öner", "which skill should I use", "what can you do", or starts a design, video, writing, coding, research or document task and it is unclear which skill fits. Türkçe ve İngilizce çalışır.
---

# Harita — Skill Router

Amaç: isteği doğru araca yönlendirmek. Kullanıcının dilinde cevap ver (TR/EN).

## Nasıl çalışır
1. İsteği aşağıdaki tablodan bir **niyete** eşle. Birden çok niyet varsa sırala (ör. önce
   `content-research-writer`, sonra `humanizer`).
2. Kullanıcıya tek satırda söyle: **"Bunun için X'i kullanıyorum, çünkü …"**. Alternatif varsa
   bir tane daha an.
3. Seçilen skill'i Skill aracıyla hemen çağır ve işe başla. Kullanıcı yalnızca liste/öneri
   istediyse çağırmadan önerip bırak.
4. Skill bu ortamda yoksa (ör. telefonda yalnızca yüklenen ZIP'ler vardır) bunu söyle ve
   `references/katalog.md` içindeki "nasıl kurulur" satırını ver.
5. Eşleşme yoksa `find-skills` ile dış ekosistemde ara; kurmadan önce kullanıcıya sor.

Ayrıntı, gereksinim ve örnek istemler: `references/katalog.md` (sadece gerekince oku).

## Yönlendirme tablosu
| Niyet / Intent | Örnek istek | Kullan | 📱 |
|---|---|---|---|
| Web sitesi, landing page, arayüz | "kafem için site yap" | `design-taste-frontend` → `frontend-design` | 🟡 |
| Ödül kalitesinde, animasyonlu/WebGL site, portfolyo | "bana etkileyici bir portfolyo yap" | `awwwards` | ❌ |
| Bir siteyi puanlamak, eleştirmek (Awwwards jürisi gibi) | "bu siteyi puanla" | `jury` | ❌ |
| UI/UX kararı, renk, font, tasarım sistemi | "SaaS paneli için palet öner" | `ui-ux-pro-max` | 🟡 |
| Poster, kapak, statik görsel (PNG/PDF) | "konser posteri tasarla" | `canvas-design` | ✅ |
| Kod ile sanat, generatif görsel | "akış alanı çiz" | `algorithmic-art` | ✅ |
| Mevcut çıktıya tema/renk uygulamak | "bu sunuma tema giydir" | `theme-factory` | ✅ |
| Canva tasarımı, marka kiti | "Canva'da post hazırla" | `canva:*` (Canva bağlantısı gerekir) | ✅ |
| Tasarım eleştirisi, erişilebilirlik | "bu ekranı değerlendir" | `design:design-critique`, `design:accessibility-review` | ✅ |
| Konuşan kafa videosu → reel | "bu videoyu kurgula, altyazı ekle" | `ghost-editor` | ❌ |
| Uzun videodan kısa klipler | "podcastten shorts çıkar" | `shorts` | ❌ |
| HTML ile animasyon/tanıtım videosu | "ürün lansman videosu" | `hyperframes` (+`-registry`, `-cli`) | ❌ |
| React ile programatik video | "Remotion ile video" | `remotion-best-practices` → `remotion-create/render/captions` | ❌ |
| Basit kesme, dönüştürme, ses çıkarma | "mp4'ü mp3 yap" | ffmpeg (doğrudan komut) | ❌ |
| Araştırmalı yazı, makale, blog | "kaynaklı blog yazısı" | `content-research-writer` | ✅ |
| Benim tarzımda yaz | "benim üslubumla post yaz" | `voice-dna` | ✅ |
| Yapay zekâ kokan metni düzelt | "bunu insan gibi yap" | `humanizer:humanizer` | ✅ |
| Prompt yaz/iyileştir | "Midjourney promptu yaz" | `prompt-master` | ✅ |
| Yeni proje/özellik fikri, planlama | "bir uygulama yapmak istiyorum" | `superpowers:brainstorming` → `superpowers:writing-plans` | 🟡 |
| Hata ayıklama | "bu neden çalışmıyor" | `superpowers:systematic-debugging` | 🟡 |
| Temiz, sade kod yazımı | "bu kodu düzenle" | `karpathy-guidelines`, `simplify` | 🟡 |
| Kod incelemesi | "kodumu incele" | `code-review`, `superpowers:requesting-code-review` | ❌ |
| Projeye Claude otomasyonu önerisi | "Claude Code'u projeme göre ayarla" | `claude-code-setup:claude-automation-recommender` | ❌ |
| Web sayfasını test et / gez | "sitemi tıklayarak test et" | `playwright` MCP veya yerleşik tarayıcı | ❌ |
| PDF oku/oluştur/birleştir | "bu PDF'leri birleştir" | `anthropic-skills:pdf` | ✅ |
| Word / Excel / PowerPoint dosyası | "Excel tablosu hazırla" | `anthropic-skills:docx` / `xlsx` / `pptx` | ✅ |
| Paylaşılacak doküman, rapor | "proje planı dokümanı" | `anthropic-skills:docs` | ✅ |
| Veri analizi, grafik, dashboard | "satış verimi analiz et" | `data:analyze`, `data:build-dashboard`, `dataviz` | ✅ |
| Derin web araştırması, rapor | "pazarı araştır" | `anthropic-skills:deep-research` | ✅ |
| PDF/Word'ü ucuza okutmak (token) | "200 sayfalık PDF'i özetle" | MarkItDown: `python -m markitdown dosya.pdf > dosya.md` | ❌ |
| Yeni skill bulmak | "X için skill var mı" | `find-skills` | ✅ |
| Kendi skill'ini yazmak | "bana bir skill yap" | `anthropic-skills:skill-creator` | ✅ |
| Ayar, izin, otomatik davranış | "her commit'ten önce test çalıştır" | `update-config` | ❌ |
| Zamanlanmış/tekrarlı iş | "her sabah özet çıkar" | `schedule`, `loop` | 🟡 |

📱 ✅ telefonda/claude.ai'de çalışır · 🟡 kısmen (yerel dosya/Node gerektiren adımlar hariç) ·
❌ yalnızca bilgisayarda Claude Code'da.

## Kurallar
- Bir isteğe en fazla 2 skill öner; uzun liste dökme.
- Kullanıcı "neler yapabilirsin" derse tabloyu kategori başlıklarıyla (Tasarım, Video, Yazı,
  Kodlama, Belge & Veri, Verimlilik) 1'er satırlık özet olarak ver.
- Hesap/bağlantı gerektiren araçlarda (Canva, Figma, GitHub) bağlantı yoksa kullanıcıya `/mcp`
  veya Ayarlar > Connectors üzerinden bağlamasını söyle.
