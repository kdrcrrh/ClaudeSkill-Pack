---
name: markitdown
description: Büyük PDF, Word, Excel, PowerPoint, HTML, CSV, EPUB veya ZIP dosyalarını okumadan önce Microsoft MarkItDown ile Markdown'a çevirir; daha az token harcar, tabloları ve başlıkları korur. Convert large documents to Markdown with MarkItDown before reading them, to save tokens and keep structure. Use when the user asks to read, summarise, search, compare or extract from a .pdf, .docx, .xlsx, .xls, .pptx, .html, .epub, .msg or .zip file, says "bu PDF'i özetle", "200 sayfalık raporu oku", "Excel'deki tabloyu çıkar", "convert to markdown", or when a document is too big to read directly. Bilgisayarda (Claude Code) çalışır; Python 3.10+ gerekir.
---

# MarkItDown — belgeyi okumadan önce Markdown'a çevir

Amaç: Belgeyi ham hâliyle okumak yerine önce Markdown'a çevirip **yalnızca gereken kısmı**
okumak. Tablolar, başlıklar ve listeler korunur; token harcaması belirgin şekilde düşer.
Kullanıcının dilinde cevap ver (TR/EN).

## Ne zaman kullan
- Kullanıcı bir **.pdf, .docx, .pptx, .xlsx/.xls, .html, .csv, .json, .xml, .epub, .msg, .zip**
  dosyasını okumanı, özetlemeni, içinde arama yapmanı ya da karşılaştırmanı istediğinde.
- Özellikle dosya büyükse (çok sayfalı PDF, çok sayfalı Excel, uzun sunum).
- **Kullanma:** düz metin (.txt, .md) ve kod dosyalarında; zaten okunabilir. Taranmış (resim)
  PDF'lerde metin çıkmaz; bunu kullanıcıya söyle.

## Adımlar
1. **Kurulu mu?** `markitdown -v` çalıştır.
   - Çalışmazsa `python -m markitdown -v` dene (PATH'te olmayabilir).
   - İkisi de yoksa kullanıcıya **tek satırla** kurulumu öner ve onay alınca çalıştır:
     ```
     pip install "markitdown[all]"
     ```
     Python 3.10 veya üstü gerekir. Windows'ta `pip` yoksa `py -m pip install "markitdown[all]"`.
     Yalnızca belirli türler için daha hafif kurulum: `pip install "markitdown[pdf,docx,xlsx,pptx]"`.
2. **Çevir** — çıktıyı belgenin yanına değil, geçici/çalışma klasörüne yaz; kullanıcının
   klasörünü kirletme:
   ```
   markitdown "rapor.pdf" -o "<çalışma-klasörü>/rapor.md"
   ```
   Birden çok dosya için her biri için ayrı çalıştır. Dosya adında boşluk varsa tırnak kullan.
3. **Akıllı oku** — Markdown'ın tamamını bir kerede okuma:
   - Önce boyutuna bak (`wc -l` / satır sayısı) ve başlıkları listele (`grep -n '^#'`).
   - İstenen bölümü satır aralığıyla oku; arama gerekiyorsa `grep -n -i "<kelime>"` kullan.
   - Küçük dosyada (birkaç yüz satır) tamamını okumak sorun değil.
4. **Cevapla** — özet, tablo ya da alıntı verirken hangi bölüm/sayfadan geldiğini belirt.

## Sorun giderme
- **Çıktı boş ya da anlamsız:** PDF büyük olasılıkla taranmış görüntüdür. Kullanıcıya OCR
  gerektiğini söyle (ör. PDF skill'i veya bir OCR aracı); uydurma içerik üretme.
- **`MissingDependencyException`:** ilgili ek paket eksik; `pip install "markitdown[all]"`.
- **Şifreli dosya:** MarkItDown açamaz; kullanıcıdan şifresiz kopya iste.
- **Excel:** her sayfa kendi adıyla `## <sayfa adı>` başlığı olarak gelir. Formüller değil
  kayıtlı değerler çıkar; dosya Excel'de hiç kaydedilmemişse formül hücreleri boş görünebilir.

## Notlar
- MarkItDown, Microsoft'un açık kaynak aracıdır (MIT): https://github.com/microsoft/markitdown —
  bu skill onu yalnızca çağırır, içinde MarkItDown kodu yoktur.
- Varsayılan kullanım yerel çalışır; dosyalar bir yere yüklenmez. Ses/YouTube dökümü ve
  Azure eklentileri gibi özellikler internet gerektirir; kullanıcı istemedikçe kullanma.
- Telefonda / claude.ai'de komut çalıştırılamadığı için bu skill orada işe yaramaz; orada
  belgeyi doğrudan yükleyip okut.
