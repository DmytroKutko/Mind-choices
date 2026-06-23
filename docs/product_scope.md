# Product Scope

## MVP Goal

Heroine Studio lets a user create a personalized heroine for a MindChoices-style coaching story. The heroine should feel shaped by the user's current life context, but the app must stay small enough to complete as a test-task project.

## Core User Flow

1. Start a new heroine or continue a saved heroine.
2. Enter personal inputs.
3. Customize the heroine.
4. Generate personalized text.
5. Save and reload the heroine for the anonymous Firebase user.

## User Inputs

- Age range.
- Gender identity.
- Current goal.
- Current mood.
- Style or vibe.

These inputs are meaningful because MindChoices is a coaching story product. They influence tone, emotional framing, and the heroine's first narrative direction without requiring the user to share deeply sensitive details.

## Customization

- Heroine name.
- Archetype.
- Traits.
- Color palette.
- Visual style.

The visual style should map to static local assets in the MVP. The app should not generate images.

## AI Output

The AI provider generates personalized text:

- Heroine profile.
- First greeting in the heroine's voice.
- Story seed or coaching reflection.

The generated text should feel reflective, grounded, and coaching-oriented. It should not become a fantasy RPG character sheet unless the selected style explicitly calls for a more mythic tone.

## Persistence

- Use Firebase anonymous authentication for a lightweight user identity.
- Save and reload the heroine through Firestore.
- The UI must not call Firebase directly.
- The saved data should include the user's inputs, customization choices, generated text, and metadata such as timestamps and schema version.

## Platforms

- Android.
- iOS.

Web can remain optional unless there is enough time after the mobile path is stable.

## Out of Scope

- AI-generated images.
- Payments.
- Email/password or social accounts.
- Multi-character seasons.
- Push notifications.
- Complex account management.
- Advanced analytics.
- Production-grade moderation pipelines.
