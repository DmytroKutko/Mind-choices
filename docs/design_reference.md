# Design Reference

## Source

The visual direction comes from the Stitch export at:

`/Users/dmytrokutko/Downloads/stitch_mindchoices_heroine_studio`

The design system source is:

`/Users/dmytrokutko/Downloads/stitch_mindchoices_heroine_studio/mindchoices_design_system/DESIGN.md`

## Overall Style

The app should feel like a calm, premium narrative coaching app. The design language is editorial, spacious, warm, and introspective rather than playful or gamified. It should support a user who is reflecting on goals and personal transformation.

The Stitch export is the implementation target, not a loose moodboard. Flutter screens should match its visual decisions as closely as practical: color roles, typography, spacing, button treatment, progress states, and calm interaction style.

## Palette

The design system uses warm, low-glare surfaces and natural pigment accents:

- Warm ivory background: `#fff8fa`.
- Deep plum text and primary actions: `#1d0b1e` and `#332034`.
- Muted rose accents: `#81515a`, `#fdbfc9`, `#ffd9df`.
- Sage green accents: `#1c2b15`, `#819376`, `#d5e9c7`.
- Soft structural borders: `#cec3cb` and related outline tones.

Use accents sparingly for progress, selected states, and success feedback. Avoid gradients, heavy shadows, and overly saturated colors.

## Typography

- Playfair Display is intended for editorial headings, screen titles, and narrative moments.
- Inter is intended for body text, labels, and controls.
- Labels use small uppercase text with added tracking.
- Body text should have generous line height for reflective reading.
- Every visible text element should use a theme or named text style that maps back to the design system.
- Avoid one-off text styling in widgets unless it is a deliberate documented exception.

Implementation note: font files should be added only when the design-token/theme phase begins. Until then, docs should reference the intended type direction without changing `pubspec.yaml`.

## Spacing And Layout

- Use an 8px spacing baseline.
- Mobile layouts use 24px side margins.
- Major sections should use generous vertical spacing.
- Components should rely on borders and tonal layering instead of shadows.
- Keep readable content centered and constrained on larger screens.

## Components

- Primary buttons: filled deep plum with white text.
- Secondary buttons: outline style with deep plum text.
- All actual buttons and tappable controls must provide Material ripple feedback. Use Material buttons when possible; use `Material` plus `InkWell` or `InkResponse` for custom controls.
- Do not implement buttons as plain tappable text or `GestureDetector`-only widgets.
- Cards: white or elevated surface, compact, 8px radius, subtle 1px border.
- Segmented controls: soft container with a clear active selection.
- Progress indicators: thin, understated, sage green.
- Chips: small uppercase labels with subtle tinted backgrounds.
- Form controls: restrained fields with bottom borders and clear focus states.

## Motion

Motion is part of the product feel. Step switching, selected states, progress/checkpoint changes, generation loading, and save confirmation should use smooth, restrained animation.

- Use short fade, slide, and size/color transitions for step and checkpoint changes.
- Use `flutter_animate` where it improves readability and polish without becoming decorative.
- Prefer 150-250 ms for small state changes and 300-450 ms for screen-level transitions.
- Keep animation calm and premium; avoid bouncy or flashy effects.
- Respect reduced-motion platform settings where practical.

## Screens Available

- `start_screen_empty`
- `start_screen_saved`
- `user_inputs_step_1`
- `heroine_customization_step_2`
- `ai_generation_loading`
- `heroine_result_step_3`
- `saved_confirmation`
- `saved_heroine_detail`

Each screen folder contains `code.html` and `screen.png` in the Stitch export.

## Required Cleanup Before Implementation

- Keep heroine name and archetype consistent across screens. The export currently mixes concepts such as "The Modern Mystic", "The Queen", "The Seeker", and a result portrait named Elara.
- Fix result screen progress copy to Step 3 of 3.
- Avoid cropped age selector behavior on mobile.
- Prefer static local image assets over remote or generated images.
- Keep the story tone closer to coaching transformation than fantasy RPG.
- Translate HTML export decisions into native Flutter widgets instead of copying HTML structure directly.
- Verify each implemented screen against its Stitch screenshot before moving on.
- Follow the detailed UI quality checklist in `docs/ui_quality_requirements.md`.
