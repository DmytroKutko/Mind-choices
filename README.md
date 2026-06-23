# MindChoices Heroine Studio

Heroine Studio is a Flutter test-task app for a MindChoices-style coaching story
experience. The app lets a user create a personalized heroine, generate
AI-written story content from their choices, save the result locally, and sync it
to Firebase for backend persistence.

## What Is Implemented

- A mobile-first Flutter flow for Android and iOS.
- Start screen with empty and saved-heroine states.
- Step 1 personalization:
  - age range;
  - gender;
  - current focus;
  - recent mood;
  - aesthetic resonance.
- Step 2 heroine customization:
  - heroine name with validation;
  - visual style;
  - archetype;
  - color palette;
  - up to 3 personality traits.
- Firebase AI Logic / Gemini text generation:
  - heroine profile;
  - first greeting;
  - story seed;
  - subtitle and traits for the profile card.
- Step 3 generated profile screen with save, regenerate, and edit actions.
- Saved heroine detail screen with generated profile, greeting, choices, and
  delete/edit/regenerate actions.
- Local persistence with Drift + SQLite.
- Backend persistence with Firebase Auth anonymous users and Cloud Firestore.
- Local-first save with best-effort Firebase sync.
- Firebase App Check integration for Android, iOS, and web debug/release
  providers.
- Environment-based Firebase configuration with no committed secrets.

## Product Decisions

The task asks for a small but working app where the user creates a personalized
heroine and gets AI value from the flow. I kept the AI scope to generated text
instead of generated images because text directly supports the coaching-story
concept and keeps latency, cost, and moderation risk lower.

The chosen user inputs are intentionally broad:

- age range instead of exact birth date;
- gender identity;
- current focus;
- recent mood;
- visual mood/aesthetic;
- archetype, visual style, palette, and traits.

These inputs are enough to shape tone and narrative direction without asking for
unnecessarily sensitive personal details.

## How The App Works

1. The user starts a new heroine or opens a saved one.
2. The app collects personal context and style preferences.
3. The user customizes the heroine's name, archetype, traits, and palette.
4. The generation screen signs in anonymously if needed, sends the selected
   fields to Firebase AI Logic, and asks Gemini for structured JSON.
5. The generated JSON is parsed into a `HeroineProfile`.
6. When the user saves, the profile is written to local SQLite first.
7. The repository then attempts to sync the same profile to Firestore under the
   current anonymous user's document path.
8. On later app launches, the repository loads local data immediately and also
   refreshes from Firestore.

## Persistence And Sync

The app uses a hybrid local/backend persistence strategy.

Local storage:

- Drift tables backed by SQLite.
- Database file: `mindchoices_heroine_studio.sqlite`.
- Stores all selected step values, generated text, timestamps, sync state, and
  last sync error.
- Enables saved heroines to survive app restart even if the network is
  unavailable.

Firebase backend:

- Firebase Auth anonymous sign-in provides a lightweight user id.
- Firestore stores profiles at:

```text
users/{uid}/heroine_profiles/{profileId}
```

Sync behavior:

- Save is local-first.
- After local save, the repository attempts Firestore sync.
- If Firestore sync fails, the local row remains available and is marked
  `pendingSync`.
- On startup/refresh, remote profiles are loaded into the local database and
  pending local rows are retried.

This keeps the app useful offline or during temporary Firebase failures while
still keeping a backend copy that can support account linking or cross-device
retrieval in a later iteration.

## AI Generation

AI generation is implemented with Firebase AI Logic using the Gemini Developer
API through the Flutter `firebase_ai` SDK.

The prompt sends only the fields required for generation:

- heroine name;
- age range;
- gender;
- current focus;
- mood;
- aesthetic resonance;
- visual style;
- archetype;
- palette;
- selected personality traits.

The model is configured to return `application/json` with a schema containing:

- `name`;
- `archetype`;
- `subtitle`;
- `traits`;
- `profile`;
- `greeting`;
- `storySeed`.

The app validates empty, incomplete, invalid, and max-token responses before
opening the result screen. Firebase/App Check/Auth errors are surfaced as
generation errors with retry support.

## Architecture

The project uses a feature-first structure:

```text
lib/
  app/
    routing/
  core/
    config/
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

Key choices:

- `flutter_bloc` for explicit multi-step flow state.
- `get_it` for lightweight dependency injection.
- `go_router` for screen navigation.
- `flutter_animate` and Flutter implicit animations for restrained motion.
- Shared UI components for buttons, step headers, selectable tiles, page shells,
  and section titles.
- Repository and AI interfaces keep UI away from Firebase SDK calls.

Important boundaries:

- Widgets do not call Firestore or Firebase AI directly.
- `HeroineFlowCubit` coordinates state and delegates persistence/generation.
- `HeroineRepository` hides local/Firebase sync details.
- `HeroineStoryGenerator` hides Firebase AI implementation details.
- Drift mapping and Firestore mapping stay in the data layer.

## Firebase Setup

The app expects a Firebase project with:

- Firebase Auth anonymous provider enabled;
- Cloud Firestore enabled;
- Firebase AI Logic enabled;
- App Check registered for the apps you run;
- Android/iOS app ids matching the bundle/package id:

```text
com.mindchoices.heroinestudio
```

For Android debug builds with App Check, add the debug token printed by the
debug provider to Firebase Console:

```text
Firebase Console -> App Check -> Android app -> Manage debug tokens
```

For iOS debug builds, register the iOS app in App Check and add the iOS debug
token printed by Xcode/Flutter logs.

## Environment Configuration

Real Firebase values are intentionally not committed.

Create a local `.env`:

```bash
cp .env.example .env
```

Then fill every required Firebase value:

```env
FIREBASE_AI_MODEL=gemini-flash-latest

FIREBASE_WEB_API_KEY=
FIREBASE_WEB_APP_ID=
FIREBASE_WEB_MESSAGING_SENDER_ID=
FIREBASE_WEB_PROJECT_ID=
FIREBASE_WEB_AUTH_DOMAIN=
FIREBASE_WEB_STORAGE_BUCKET=

FIREBASE_ANDROID_API_KEY=
FIREBASE_ANDROID_APP_ID=
FIREBASE_ANDROID_MESSAGING_SENDER_ID=
FIREBASE_ANDROID_PROJECT_ID=
FIREBASE_ANDROID_STORAGE_BUCKET=

FIREBASE_IOS_API_KEY=
FIREBASE_IOS_APP_ID=
FIREBASE_IOS_MESSAGING_SENDER_ID=
FIREBASE_IOS_PROJECT_ID=
FIREBASE_IOS_STORAGE_BUCKET=
FIREBASE_IOS_BUNDLE_ID=

APP_CHECK_RECAPTCHA_SITE_KEY=
```

Also provide platform Firebase files locally when building native apps:

```text
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
```

These files are ignored by git, together with `.env` and `.firebaserc`.

## Run Instructions

Install dependencies:

```bash
flutter pub get
```

Run on Android:

```bash
flutter run -d android
```

Run on iOS:

```bash
flutter run -d ios
```

Build Android debug APK:

```bash
flutter build apk --debug
```

Build iOS without code signing:

```bash
flutter build ios --no-codesign
```

## Verification

Commands used during development:

```bash
dart format lib test
flutter analyze
flutter test
flutter build apk --debug
```

Current widget coverage verifies:

- bootstrap/start screen;
- navigation into step 1 and step 2;
- heroine name validation;
- successful AI generation path with mocked generator;
- AI generation failure message path;
- generated result screen;
- save confirmation;
- edit choices navigation;
- saved heroine detail screen.

## Demo Materials

- [Google Stitch design reference](https://stitch.withgoogle.com/projects/13843388325237054075)
- [Screenshots and supporting media](https://drive.google.com/drive/folders/1cdOUNJ1usYreR8xawNUY1JZEdYRfFVat?usp=sharing)
- [Recorded app demo](https://drive.google.com/file/d/1_D-V-_U_5giCOLmsuKK2O0-z_MflBo0X/view?usp=sharing)

## Demo Video Checklist

A 2-4 minute demo should show:

1. Launch on Android and/or iOS.
2. Empty start screen.
3. Step 1 personalization choices.
4. Step 2 heroine customization.
5. Firebase AI generation loading state.
6. Generated profile result.
7. Save heroine.
8. Return to start screen and open saved heroine.
9. Mention local SQLite save plus Firestore sync.
10. Mention App Check and anonymous auth briefly.

## AI Development Tooling

AI coding assistance was used to speed up:

- converting the test-task requirements into implementation docs;
- setting up the Flutter architecture;
- iterating on UI details against Stitch screenshots;
- adding Firebase AI Logic, App Check, Firestore, and local persistence;
- debugging App Check debug tokens and Firebase AI generation errors;
- writing and updating tests and README documentation.

All generated code was reviewed and adjusted against the actual app behavior,
Firebase Console state, and Flutter verification commands.

## Trade-offs And Known Limits

- Anonymous auth is intentionally low-friction, but account recovery is limited
  if the user clears app data or reinstalls without account linking.
- AI image generation is not implemented; local static images are used for the
  MVP.
- Realtime Database is enabled in Firebase but not used by the current app flow.
- App Check debug tokens must be registered manually for local debug builds.
- The local database is schema version 1 and has no migration history yet.
- Firestore sync is best-effort from the client. A production app could move
  generation and sync orchestration behind Cloud Functions for stronger policy
  enforcement and rate limiting.
- The repository includes prototype Firestore Security Rules for owner-scoped
  anonymous profiles. They should be reviewed again before a public production
  release.

## Supporting Docs

- [Task brief](docs/task_brief.md)
- [Product scope](docs/product_scope.md)
- [Design reference](docs/design_reference.md)
- [UI quality requirements](docs/ui_quality_requirements.md)
- [Architecture](docs/architecture.md)
- [Firebase plan](docs/firebase_plan.md)
- [Implementation plan](docs/implementation_plan.md)
- [Firestore security findings](docs/firestore_security_findings.md)
