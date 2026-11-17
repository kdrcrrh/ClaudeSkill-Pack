---
name: voice-dna
description: Builds a reusable "voice DNA" profile from the user's own writing samples (posts, emails, captions, scripts) and then writes new text in that exact voice. Use when the user says "benim tarzımda yaz", "sesimi/üslubumu çıkar", "voice DNA", "write like me", "match my tone", "analyze my writing style", or asks for social posts, scripts or emails that should sound like them rather than like AI. Türkçe ve İngilizce çalışır.
---

# Voice DNA / Ses DNA'sı

Goal: capture how this person actually writes, save it as a profile, and reuse it so every new
text sounds like them. Respond in the language the user writes in.

## 1. Collect samples
- Ask for 3–10 real samples the user wrote themselves (not AI-edited): posts, captions, emails,
  video scripts. Total 500+ words is ideal; fewer works but say the profile will be rougher.
- If a profile already exists (`voice-dna-<isim>.md` in the working folder or one the user
  pastes), skip to step 4.

## 2. Analyze (show evidence, not guesses)
Measure and quote from the samples:
- **Ritim:** average sentence length, short/long mix, paragraph length, line breaks.
- **Kelime:** recurring words and phrases, slang, English loanwords, emoji use, formality
  (sen/siz), favourite openers and closers.
- **Yapı:** how they open (question, bold claim, story), how they argue, list vs prose, CTA style.
- **Ton:** humour, directness, warmth, confidence; what they never do.
- **Noktalama:** exclamation marks, ellipses, caps, hashtags.

## 3. Save the profile
Write `voice-dna-<isim>.md` with: a 3-sentence summary, the measurements above, 10 "always"
rules, 10 "never" rules (include AI tells they avoid: "Sonuç olarak", "delve", empty triads,
em-dash chains), and 3 short verbatim sample lines as anchors. On claude.ai/phone, give the
profile as a block the user can paste into a Project's instructions.

## 4. Write in the voice
- Draft, then self-check every rule in the profile; fix violations before showing.
- Keep the user's facts; never invent personal anecdotes — mark `[buraya kendi örneğin]`.
- Offer one variant that is slightly bolder or calmer if the brief is ambiguous.

## 5. Improve
When the user edits a draft, note what they changed and propose a one-line profile update.
