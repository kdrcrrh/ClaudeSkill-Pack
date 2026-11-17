---
name: prompt-master
description: Turns a rough request into a strong, ready-to-use prompt for Claude, ChatGPT, Gemini, Midjourney or other AI tools, using the Rol + Bağlam + Görev + Kısıt + Format formula. Use when the user says "prompt yaz", "promptumu geliştir", "bunu nasıl sorayım", "improve my prompt", "write a prompt for", "system prompt hazırla", or pastes a prompt that gives weak results. Türkçe ve İngilizce çalışır.
---

# Prompt Master

Respond in the user's language; write the final prompt in the language the target tool works
best in (default: same as the user's, English for image models unless they say otherwise).

## 1. Understand the target
Identify: which tool/model, what output is wanted, who will read it, and what "good" looks like.
If one of these is unknown and changes the prompt a lot, ask one short question; otherwise pick a
sensible default and state it.

## 2. Build with the formula
- **Rol (Role):** who the model should act as, with the relevant expertise.
- **Bağlam (Context):** background, audience, inputs, why this matters.
- **Görev (Task):** one clear action verb and the concrete deliverable.
- **Kısıt (Constraints):** length, tone, what to avoid, facts that must stay, sources.
- **Format:** exact output shape (table, bullets, JSON, sections, word count).
Add when useful: 1–2 examples, step order, a self-check line ("Before answering, verify…").

## 3. Tool-specific tips
- **Claude:** plain clear instructions, explain the why, XML tags for long inputs
  (`<belge>…</belge>`), ask for the answer format explicitly.
- **Image models (Midjourney, GPT image, Gemini, Canva):** subject → style → composition →
  lighting → color palette → camera/lens → aspect ratio; avoid negatives inside the main sentence.
- **Video models:** shot type, camera move, duration, subject action, mood, audio.
- **System prompts / Projects:** stable rules only; put task specifics in the user turn.

## 4. Deliver
Return: (1) the final prompt in a copyable code block, (2) 2–3 lines on what changed and why,
(3) one optional variant (shorter or more detailed). Do not run the prompt unless asked.
