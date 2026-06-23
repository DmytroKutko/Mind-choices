# Task Brief

## Source Materials

- Test task PDF: `/Users/dmytrokutko/Downloads/Test_Task_Full-Stack_Flutter.md.pdf`
- Stitch design export: `/Users/dmytrokutko/Downloads/stitch_mindchoices_heroine_studio`
- Design system file: `/Users/dmytrokutko/Downloads/stitch_mindchoices_heroine_studio/mindchoices_design_system/DESIGN.md`

## Context

MindChoices by MindAction builds interactive coaching games for women. The product combines narrative stories, decision-making, psychology, and coaching exercises. The test task is meant to evaluate a sole full-stack Flutter developer who can make product decisions, cover UI and backend work, use AI coding tools effectively, and communicate trade-offs clearly.

## Core Requirements

- Build a small but working Flutter mini-app where a user creates and customizes a game character, "their heroine".
- Collect real user inputs and use them to personalize the heroine. Suggested inputs include age, gender, style or vibe, current goal, mood, or archetype.
- Add an AI-powered element that creates real value in the flow. The expected scope is text generation, such as a personalized heroine profile, greeting, or short story/coaching reflection.
- Persist the created heroine so it survives app restart and can ideally be retrieved on another device.
- Run on Android and iOS. Web is optional and can be a plus.
- Use Flutter and any reasonable state management approach.
- Use Firebase, Supabase, or a small custom API for backend persistence.
- Do not commit secret keys. Use environment configuration or a mockable provider.

AI text generation is a core requirement. AI image generation is out of scope for this MVP.

## What Must Be Submitted

- A GitHub repository link with a clear README.
- Run or build instructions, such as Android APK instructions, build steps, screenshots, or a short GIF.
- A 2-4 minute demo video showing the app running on Android and iOS, the customization and AI flow, and key decisions.
- A short note on AI development tooling: which tools were used and how they sped up the work.

## Evaluation Criteria

- Android and iOS launch successfully.
- The heroine is persisted via a backend and reloads correctly.
- The AI feature is a real, sensible LLM integration that adds value.
- User inputs are meaningful for a coaching story game and are justified.
- The UX shows thoughtful product decisions even without a designer.
- Code is readable, clean, and structured for a sole-developer product.
- The README and demo communicate decisions, trade-offs, and unfinished work honestly.

## Chosen MVP Interpretation

Heroine Studio will be a focused three-step creation flow:

1. The user shares personal context: age range, gender identity, current goal, mood, and preferred style or vibe.
2. The user customizes the heroine: name, archetype, traits, color palette, and visual style.
3. The app generates personalized text content for the heroine and lets the anonymous Firebase user save and reload it.

The app will use static local images for visual polish. AI will generate only personalized text: a heroine profile, a first greeting, and a short story seed or coaching reflection. This keeps the scope aligned with the task while avoiding the cost, latency, and moderation complexity of image generation.
