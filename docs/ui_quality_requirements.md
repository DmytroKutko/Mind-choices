# UI Quality Requirements

## Design Fidelity

The implemented UI must match the Stitch design direction as closely as practical for a Flutter MVP. The design export is not loose inspiration; it is the visual target for layout, spacing, colors, typography, controls, and interaction tone.

Primary references:

- `/Users/dmytrokutko/Downloads/stitch_mindchoices_heroine_studio`
- `/Users/dmytrokutko/Downloads/stitch_mindchoices_heroine_studio/mindchoices_design_system/DESIGN.md`

Implementation should translate the Stitch screens into native Flutter widgets, not copy the HTML structure directly.

## Typography

All visible text must use text styles from the app theme or named app text styles derived from the design system.

- Use Playfair Display for editorial headings, screen titles, and narrative moments.
- Use Inter for functional UI, body copy, labels, inputs, chips, and buttons.
- Do not create one-off text styling inside widgets unless it is a documented design-system exception.
- Labels should follow the design system: small, uppercase, tracked, and restrained.
- Long-form generated text should use comfortable line height and match the narrative/coaching tone.

Before finishing a screen, compare every visible text element against the design style role it represents.

## Buttons And Touch Feedback

Every interactive button must have Material ripple feedback.

Acceptable approaches:

- Use Flutter Material buttons such as `ElevatedButton`, `OutlinedButton`, `TextButton`, or `IconButton` when they match the design.
- For custom-shaped buttons or choice cards, use `Material` plus `InkWell` or `InkResponse`, with the ripple clipped to the component shape.

Do not implement button behavior with plain `GestureDetector`, `MouseRegion`, or tappable `Text` unless the widget also provides proper Material ink feedback and accessibility semantics.

Text that is only descriptive text should remain text. The ripple rule applies to actual buttons and tappable controls.

## Selection And Checkpoint Motion

State changes should feel smooth and intentional:

- Step changes should animate with subtle fade and slide transitions.
- Selected chips, cards, segmented controls, and checklist/checkpoint states should animate between selected and unselected states.
- Progress indicators should animate when moving between steps.
- Loading states should use restrained motion that matches the calm premium design.
- Save confirmations should feel polished but not flashy.

Use built-in implicit animations for simple changes and `flutter_animate` for subtle screen, loading, and checkpoint transitions. Avoid heavy animation assets unless deliberately added later.

Motion should stay short and calm:

- Typical UI state changes: 150-250 ms.
- Screen-level transitions: 300-450 ms.
- Prefer ease-out or ease-in-out curves.
- Respect platform reduced-motion settings where practical.

## Component Consistency

- Buttons must use the same dimensions, border radius, color roles, and typography across the flow.
- Cards should use subtle borders and tonal layering rather than heavy shadows.
- Chips and segmented controls should have clear selected states.
- Touch targets should be large enough for mobile use.
- Components should not resize unpredictably when selected, hovered, or loading.
- Text must not overflow, clip, or overlap at mobile widths.

## Verification

For each implemented screen:

1. Compare against the relevant Stitch screenshot.
2. Check typography role mapping.
3. Confirm every button/control has ripple feedback.
4. Confirm selection and progress changes animate smoothly.
5. Check mobile layout for clipping, overflow, and cropped controls.
6. Run `dart format lib test`, `flutter analyze`, and relevant tests.
7. For UI-heavy work, run the app and capture screenshots before considering the screen done.
