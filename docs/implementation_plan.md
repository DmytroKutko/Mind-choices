# Implementation Plan

## Current Checkpoint

- Phase 0 is complete.
- Phase 1 is complete for the implemented static flow.
- Phase 2 is partially complete: the in-memory multi-step flow, deterministic mock content, and selection animations exist, but model serialization tests are still pending.
- Firebase SDK initialization is complete for Android, iOS, and web options. Firebase Auth, Firestore, Realtime Database, and Firebase AI Logic are registered in dependency injection, but no UI or repository code calls them yet.

## Phase 0: Project Setup And Docs

Scope:

- Create repository guidance.
- Summarize the task brief.
- Define product scope, design reference, architecture, Firebase plan, and implementation phases.
- Add a minimal app shell with routing, theme setup, Bloc observer, and dependency bootstrap.

Acceptance criteria:

- `AGENTS.md` exists.
- Planning docs exist under `docs/`.
- `README.md` points to the planning docs.
- No feature implementation has started.
- Baseline packages are installed: Google Fonts, Bloc, Equatable, GetIt, GoRouter, and Flutter Animate.

Verification commands:

```bash
flutter analyze
flutter test
```

## Phase 1: Theme, Design Tokens, And Static Navigation

Scope:

- Add app theme tokens based on the Stitch design system.
- Add named text styles that map to every typography role used by the Stitch screens.
- Add local static assets only after selecting the minimum needed image set.
- Replace the default counter app with static navigation and placeholder screens.
- Set the visible app title to Heroine Studio.
- Define shared button/control patterns with Material ripple feedback.
- Add baseline motion patterns for step transitions, selected states, and progress/checkpoint changes.

Acceptance criteria:

- App launches on Android and iOS.
- The first screen matches the Heroine Studio design direction closely, not approximately.
- Navigation covers start, input, customization, generation, result, save confirmation, and detail placeholders.
- All visible text uses theme or named text styles derived from the design system.
- All buttons and tappable controls have Material ripple feedback.
- Static placeholder transitions feel smooth and restrained.
- No Firebase or AI dependency is required yet.

Current note: Firebase SDK packages are already installed and initialized because the project is configured, but the static UI flow still does not require live Firebase calls.

Verification commands:

```bash
dart format lib test
flutter analyze
flutter test
```

## Phase 2: Models And Mock Flow

Scope:

- Add `UserPreferences`, `HeroineDraft`, `GeneratedHeroineContent`, and `HeroineProfile`.
- Implement the multi-step flow with in-memory state.
- Add deterministic mock content.
- Animate input selection, archetype/trait choices, and progress/checkpoint changes.

Acceptance criteria:

- A user can complete the flow without Firebase or AI credentials.
- The selected inputs affect the displayed heroine content.
- Selection state changes are smooth and visually clear.
- Buttons and custom choice controls keep ripple feedback.
- Model serialization has unit test coverage.

Verification commands:

```bash
dart format lib test
flutter analyze
flutter test
```

## Phase 3: Local / Static AI Fallback

Scope:

- Add `AiProfileService`.
- Add `MockAiProfileService` as the default-safe provider.
- Add prompt-shaping rules and output structure without calling a remote provider.

Acceptance criteria:

- The generation screen has loading, success, and failure states.
- Mock output is deterministic and useful for demos.
- The app works without secrets.

Verification commands:

```bash
dart format lib test
flutter analyze
flutter test
```

## Phase 4: Firebase Auth And Firestore Save / Reload

Scope:

- Configure Firebase for Android and iOS.
- Add anonymous auth.
- Add `HeroineRepository` backed by Firestore.
- Save and reload the latest heroine profile.

Acceptance criteria:

- A saved heroine survives app restart.
- Firestore writes are scoped to the anonymous Firebase user.
- UI does not call Firebase directly.
- The mock AI flow still works without Gemini access.

Verification commands:

```bash
dart format lib test
flutter analyze
flutter test
flutter run -d android
flutter run -d ios
```

## Phase 5: Firebase AI Logic / Gemini Integration

Scope:

- Add `FirebaseAiProfileService`.
- Build prompts from user preferences and heroine draft.
- Parse AI output into `GeneratedHeroineContent`.
- Keep the mock provider available as fallback.

Acceptance criteria:

- Real AI generation works when Firebase AI Logic is configured.
- The app degrades to mock output when the real provider is unavailable.
- Prompts do not include unnecessary sensitive data.
- Generated text is saved with provider metadata.

Verification commands:

```bash
dart format lib test
flutter analyze
flutter test
flutter run -d android
flutter run -d ios
```

## Phase 6: Error States, Polish, README, Screenshots, Demo Video

Scope:

- Polish empty, loading, error, saved, and reload states.
- Add final README with run instructions, decisions, trade-offs, privacy notes, AI tooling notes, screenshots, and next steps.
- Perform screen-by-screen visual comparison against the Stitch screenshots.
- Verify typography, ripple feedback, motion, mobile layout, and clipping behavior.
- Capture Android and iOS evidence.
- Prepare the 2-4 minute demo video.

Acceptance criteria:

- Android and iOS launch successfully.
- The README explains the chosen inputs, AI value, privacy handling, and unfinished trade-offs.
- Screenshots or GIF are available.
- Demo video shows the customization, AI, save, and reload flow.
- UI quality checklist in `docs/ui_quality_requirements.md` is satisfied for implemented screens.

Verification commands:

```bash
dart format lib test
flutter analyze
flutter test
flutter build apk
flutter build ios --no-codesign
```
