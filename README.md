# 🗺️ Claude Haritası · Claude Map

**Yeni başlayanlar için kategori kategori Claude skill paketleri.** · **Claude skill bundles by category, for beginners.**

Tasarım, video, yazı, kodlama ve verimlilik için açık kaynak skill'leri tek yerde topladık. İstediğin kategoriyi tek tıkla ya da tek komutla kurarsın. Bir de **harita** skill'i var: ne istediğini anlar ve hangi skill'in işini göreceğini söyler.
Open-source skills for design, video, writing, coding and productivity, gathered in one place. Install a whole category in one click or one command. The **harita** (“map”) skill reads your request and tells you which skill to use.

> ### ⚠️ Sorumluluk reddi · Disclaimer
> **TR:** Bu repo, başkalarının geliştirdiği açık kaynak skill'leri **yalnızca bir kullanıcı olarak** derleyip kolay kurulum için bir araya getirir. Repo sahibi buradaki üçüncü taraf skill ve kodların **hiçbirine, hiçbir aşamada katkı vermemiş ve görüş bildirmemiştir**, geliştiricileriyle bir bağı yoktur. Yazılımlar "olduğu gibi" sunulur; kurulum ve kullanımdan doğacak aksaklıklar **hiçbir şekilde bu repoya dayandırılamaz.** Destek, hata bildirimi ve benzeri **tüm talepler skill ve kod sahiplerine**, kendi repoları üzerinden iletilmelidir. Tam metin: [DISCLAIMER.md](DISCLAIMER.md)
>
> **EN:** This repo compiles open-source skills developed by others, **purely as a user**, for easy installation. The repo owner has **not contributed to, nor given any opinion on, any of the third-party skills or code here, at any stage**, and has no affiliation with their developers. Software is provided "as is"; any malfunction arising from installation or use **can in no way be attributed to this repo.** **All requests** — support, bug reports and the like — must go **to the owners of the skills and code**, through their own repositories. Full text: [DISCLAIMER.md](DISCLAIMER.md)

---

## 📦 Paketler · Bundles

| Paket / Bundle | İçindekiler / Contents | 📱 Telefon / Phone |
|---|---|---|
| 🎨 **tasarim** | frontend-design, canvas-design, theme-factory, algorithmic-art, brand-guidelines, ui-ux-pro-max, design-taste-frontend | çoğu / most |
| 🎬 **video** | ghost-editor, shorts, hyperframes, hyperframes-cli, hyperframes-registry | — (bilgisayar / desktop) |
| ✍️ **yazi** | voice-dna, prompt-master | ✓ |
| 💻 **kodlama** | karpathy-guidelines | ✓ |
| ⚡ **verimlilik** | harita, find-skills | ✓ |

Her skill'in sahibi, lisansı ve bağlantısı: **[TESEKKURLER.md](TESEKKURLER.md)** · Owner, licence and link for every skill: **[TESEKKURLER.md](TESEKKURLER.md)**
Ayrıntılı kılavuz (PDF, TR+EN): **[docs/Claude-Haritasi.pdf](docs/Claude-Haritasi.pdf)** · Full guide (PDF, TR+EN)

---

## 🇹🇷 Kurulum

### Yol 1 — En kolayı: ZIP indir
1. Sağdaki **Releases** bölümünden istediğin paketi indir (ör. `Claude-video-paketi.zip`) ve aç.
2. **Windows:** `kur.ps1` dosyasına sağ tıkla → **PowerShell ile çalıştır**. **Mac/Linux:** klasörde `bash kur.sh`.
3. Claude Code'da (masaüstü uygulamasının **Code** sekmesi ya da terminal) yeni bir oturum aç. Hazır.

### Yol 2 — Claude Code plugin marketi
Claude Code'a şunu yaz:
```
/plugin marketplace add kdrcrrh/claude-haritasi
/plugin install video@claude-haritasi
```
`video` yerine `tasarim`, `yazi`, `kodlama` veya `verimlilik` yazabilirsin.

### Yol 3 — Repoyu klonla
```bash
git clone https://github.com/kdrcrrh/claude-haritasi.git
cd claude-haritasi
bash kur.sh video            # Windows: powershell -ExecutionPolicy Bypass -File kur.ps1 video
```
Hepsini kurmak için: `bash kur.sh hepsi`

### 📱 Telefonda / claude.ai'de
Paket ZIP'inin içindeki `claude-ai` klasöründe her skill ayrı bir ZIP'tir. claude.ai → **Customize → Skills → Upload** ile yükle (ZIP'i açma). Ayarlarda **Code execution and file creation** açık olsun. Bir kez yüklersen web, masaüstü ve telefonda görünür. Video skill'leri bilgisayardaki programlara ihtiyaç duyduğu için telefonda çalışmaz.

### Nasıl kullanılır?
Komut ezberlemene gerek yok. Normal dille iste: *“Bu videodan reel yap”*, *“Kafem için site tasarla”*, *“Benim tarzımda bir post yaz”*. Claude uygun skill'i kendisi seçer. Emin değilsen **“Neler yapabilirsin?”** yaz.

### Sık sorulanlar
- **Skill ile plugin farkı?** Skill, Claude'a bir işi öğreten talimat klasörüdür. Plugin, birkaç skill'i ve bağlantıyı tek kutuda kurar.
- **Gerekenler?** Video paketi için ffmpeg, Python ve Node.js; taste skill için Node 22+ ve Chrome/Edge.
- **Bir skill hata verirse?** Lütfen o skill'in kendi reposuna bildir (bağlantılar [TESEKKURLER.md](TESEKKURLER.md)'de). Bu repo destek vermez.

---

## 🇬🇧 Installation

### Option 1 — Easiest: download a ZIP
1. Download the bundle you want from **Releases** on the right (e.g. `Claude-video-paketi.zip`) and unzip it.
2. **Windows:** right-click `kur.ps1` → **Run with PowerShell**. **Mac/Linux:** run `bash kur.sh` in the folder.
3. Open a new session in Claude Code (the desktop app's **Code** tab or the terminal). Done.

### Option 2 — Claude Code plugin marketplace
Type this in Claude Code:
```
/plugin marketplace add kdrcrrh/claude-haritasi
/plugin install video@claude-haritasi
```
Replace `video` with `tasarim` (design), `yazi` (writing), `kodlama` (coding) or `verimlilik` (productivity).

### Option 3 — Clone the repo
```bash
git clone https://github.com/kdrcrrh/claude-haritasi.git
cd claude-haritasi
bash kur.sh video            # Windows: powershell -ExecutionPolicy Bypass -File kur.ps1 video
```
Install everything: `bash kur.sh hepsi`

### 📱 On your phone / claude.ai
Inside each bundle ZIP, the `claude-ai` folder holds one ZIP per skill. Upload it via claude.ai → **Customize → Skills → Upload** (don't unzip). Turn on **Code execution and file creation** in settings. Upload once and it appears on web, desktop and phone. Video skills need desktop programs and don't run on the phone.

### How to use
No commands to memorise. Ask in plain language: *“Make a reel from this video”*, *“Design a site for my café”*, *“Write a post in my voice”*. Claude picks the right skill. Not sure? Ask **“What can you do?”**

### FAQ
- **Skill vs plugin?** A skill is a folder of instructions that teaches Claude a task. A plugin installs several skills and connections in one box.
- **Requirements?** Video bundle: ffmpeg, Python and Node.js; taste skill: Node 22+ and Chrome/Edge.
- **A skill throws an error?** Please report it to that skill's own repository (links in [TESEKKURLER.md](TESEKKURLER.md)). This repo does not provide support.

---

## 🙏 Teşekkürler · Thanks
Bu repodaki üçüncü taraf skill'lerin tüm emeği sahiplerine aittir: **Anthropic, Next Level Builder, Leonxlnx, HeyGen, kurbaitaev, Daniel Agrici, multica-ai, Vercel.** Açık kaynak paylaşımları için hepsine teşekkürler. Ayrıntılar ve bağlantılar: [TESEKKURLER.md](TESEKKURLER.md).
All credit for the third-party skills goes to their owners listed above. Thank you for sharing your work as open source.

**Lisans · Licence:** Her skill kendi klasöründeki `LICENSE` dosyasına tabidir. Bu repo için yazılan kısımlar (`voice-dna`, `prompt-master`, `harita`, script'ler, kılavuz) MIT lisanslıdır ([LICENSE](LICENSE)). · Each skill is governed by the `LICENSE` in its folder. Parts written for this repo are MIT-licensed.
