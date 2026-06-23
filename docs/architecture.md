# Architecture

## Goals

- Keep the codebase simple enough for a test task.
- Make Firebase and AI providers replaceable behind small interfaces.
- Let the app work without secrets by using a mock AI fallback.
- Keep UI, persistence, auth, and AI responsibilities separate.
- Keep state transitions explicit and easy to explain in the final demo.

## Proposed Structure

Use a feature-first structure:

```text
lib/
  app/
    routing/
  core/
    di/
    firebase/
    observability/
    theme/
    widgets/
  features/
    heroine/
      data/
      domain/
      presentation/
```

This keeps the main product flow easy to inspect while separating app bootstrap, platform services, shared UI, and feature code.

## State Management

Use Bloc for this project.

Reasoning:

- The current app is a fresh Flutter scaffold and has no existing state management.
- Bloc gives the multi-step heroine flow explicit events and states, which are easy to test and explain in a test-task review.
- `flutter_bloc` is familiar, mature, and suitable for async generation/save/reload states.
- `equatable` keeps state comparisons simple without code generation.
- Bloc keeps UI behavior clear while `get_it` handles service construction.

Avoid introducing a heavier architecture until the MVP has real complexity that needs it.

## Dependency Injection

Use `get_it` as a lightweight service locator.

- Register concrete services in one dependency bootstrap file.
- Keep Firebase, repositories, and AI providers behind interfaces.
- Do not add `injectable` yet. Code generation is unnecessary until the graph becomes larger.
- Tests can override services directly through the service locator or by injecting blocs with mock dependencies.

## Navigation And Motion

- Use `go_router` for named, multi-step navigation.
- Use built-in Flutter implicit animations for simple state transitions.
- Use `flutter_animate` for subtle fade, slide, and loading polish.
- Animate selected states, checkpoint/progress changes, and step transitions instead of swapping UI abruptly.
- Keep motion restrained: 150-250 ms for control state changes and 300-450 ms for screen-level transitions.
- Respect platform reduced-motion settings where practical.
- Avoid Lottie/Rive until there are deliberate animation assets. They are useful later, but premature for this MVP.

## UI Component Rules

- All buttons and tappable controls must expose Material ripple feedback through Material buttons or `Material` plus `InkWell` / `InkResponse`.
- Plain `GestureDetector` should not be used for button behavior unless wrapped with proper Material ink feedback and accessibility semantics.
- Text styling should come from the app theme or named app text styles derived from the Stitch design system.
- UI code should not create one-off typography values for normal text roles.

## Domain Models

- `UserPreferences`
  - Age range, gender identity, current goal, mood, and style or vibe.
- `HeroineDraft`
  - Name, archetype, traits, color palette, visual style, and selected static image asset id.
- `GeneratedHeroineContent`
  - Personalized profile, first greeting, story seed, coaching reflection, provider metadata.
- `HeroineProfile`
  - Stable saved aggregate containing preferences, draft, generated content, owner id, timestamps, and schema version.

## Services

- `AuthService`
  - Owns anonymous Firebase sign-in and exposes the current user id.
- `HeroineRepository`
  - Saves and loads heroine profiles.
  - Hides Firestore details from UI.
- `AiProfileService`
  - Interface for generating heroine text from preferences and draft data.
- `MockAiProfileService`
  - Default-safe fallback that returns deterministic text without secrets or network calls.
- `FirebaseAiProfileService`
  - Firebase AI Logic / Gemini implementation for real text generation.

## Repository Boundaries

- UI should not call Firebase SDKs directly.
- UI should depend on blocs or simple controllers, not raw backend clients.
- The AI provider must be replaceable.
- The mock AI provider should be the default-safe fallback when Firebase AI is not configured or when the app runs in a local demo mode.
- Firestore document parsing should stay in data-layer mappers, not widgets.

## Error Handling

- Treat AI generation as optional to app usability: a mock or cached result should keep the flow demoable.
- Show clear retry states for generation and save failures.
- Keep sensitive user input out of logs.
- Store provider errors separately from generated content so failed generations do not corrupt saved profiles.

## Testing Direction

- Unit test model serialization and repository mapping.
- Unit test mock AI output for stable snapshots.
- Widget test the multi-step flow with mocked providers.
- Add integration smoke only after Firebase configuration exists.
