# Firebase Plan

## Goals

- Provide a lightweight full-stack layer for the test task.
- Support anonymous save and reload without account friction.
- Keep secrets out of the repository.
- Keep AI text generation replaceable and mockable.

## Firebase Products

- Firebase Auth: anonymous sign-in.
- Firestore: persistence for saved heroine profiles.
- Realtime Database: available in the Firebase project, reserved for future realtime or lightweight sync needs if the MVP scope grows.
- Firebase AI Logic / Gemini: personalized text generation.

## Authentication

On app start or before first save:

1. Check whether a Firebase user already exists.
2. If not, sign in anonymously.
3. Use the anonymous `uid` as the owner id for heroine documents.

Anonymous auth is enough for the MVP. If a user uninstalls the app or clears local data, account recovery is not guaranteed. That limitation should be documented in the final README.

## Firestore Collections

Preferred path:

```text
users/{uid}/heroine_profiles/{heroineId}
```

This keeps user-owned documents easy to secure and query.

## Proposed Document Shape

```json
{
  "id": "heroine_abc123",
  "ownerUid": "firebase_anonymous_uid",
  "schemaVersion": 1,
  "status": "saved",
  "userPreferences": {
    "ageRange": "25-34",
    "genderIdentity": "woman",
    "currentGoal": "find clarity before a career change",
    "mood": "uncertain but hopeful",
    "styleVibe": "calm editorial"
  },
  "draft": {
    "name": "Elara",
    "archetype": "The Seeker",
    "traits": ["reflective", "resilient", "curious"],
    "colorPalette": "deep_plum_sage",
    "visualStyle": "premium_editorial",
    "imageAssetId": "heroine_seeker_01"
  },
  "generatedContent": {
    "profile": "Short generated heroine profile...",
    "firstGreeting": "Generated greeting...",
    "storySeed": "Generated story seed...",
    "coachingReflection": "Generated reflection...",
    "provider": "firebase_ai_logic",
    "model": "gemini",
    "generatedAt": "2026-06-23T12:00:00Z"
  },
  "createdAt": "2026-06-23T12:00:00Z",
  "updatedAt": "2026-06-23T12:00:00Z"
}
```

## Security Rules Direction

Rules should allow an authenticated Firebase user to read and write only their own documents:

```text
match /users/{userId}/heroine_profiles/{heroineId} {
  allow read, write: if request.auth != null && request.auth.uid == userId;
}
```

Final rules should validate required fields and schema shape once the data model stabilizes.

## Firebase AI Logic / Gemini

The AI service should generate text only:

- Heroine profile.
- First greeting.
- Story seed or coaching reflection.

The app should use a prompt builder that receives `UserPreferences` and `HeroineDraft`, then returns structured text fields. The generated content should be saved only after user confirmation or after a successful generation step.

Firebase AI Logic is expected to avoid direct committed secrets in app code. The Flutter SDK should use `FirebaseAI.googleAI()` with the configured Firebase app, not direct REST calls and not Vertex AI for this MVP. The app must keep a mock AI provider available so the core flow works without live Gemini access.

## Privacy Notes

- Treat age, gender identity, goals, mood, and preferences as sensitive personal context.
- Ask for broad age range instead of exact birth date.
- Avoid logging raw prompts, user inputs, or generated content in production.
- Keep prompts minimal: send only the fields needed to generate the text.
- Provide delete or overwrite behavior if time allows.
- Be honest in the README about what data is stored and why.

## Production Considerations

- Enable Firebase App Check before production release.
- Add rate limits and quota monitoring for AI generation.
- Add defensive prompt constraints and output validation.
- Consider Cloud Functions if server-side policy enforcement, stronger privacy controls, or provider abstraction becomes necessary.
- Add analytics only after consent and privacy expectations are clear.
