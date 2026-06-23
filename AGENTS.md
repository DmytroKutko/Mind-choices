# AGENTS.md instructions

## For every new session

- If this is the first prompt in the session, read `CLAUDE.md` if it exists before making code changes.

## General working rules

1. Do not start coding immediately for non-trivial tasks.
2. First understand the task, inspect the relevant existing code, and create a short execution plan.
3. Prefer small, safe, incremental changes.
4. Do not introduce unnecessary abstractions.
5. Follow the existing Flutter and Dart style over generic best practices.
6. Keep scope tight and avoid adjacent cleanup unless it is required for the task.
7. Ask for clarification only when the task is blocked or the requirements are dangerously ambiguous.

## Final verification

Before finishing any non-trivial task, the main agent must:

1. Review all changed files.
2. Check architecture boundaries.
3. Run formatting when code files changed.
4. Run static analysis.
5. Run relevant tests if available.
6. Fix critical issues.
7. Report any remaining risks clearly.

## Final response format

At the end of the task, report:

1. Whether subagents were used.
2. Which subagents were used and why.
3. What each subagent did.
4. What files were changed.
5. Any conflicts found and how they were resolved.
6. Commands run and their results.
7. Remaining risks or follow-up work.

## Project-specific notes

- App display name: Heroine Studio.
- Flutter project/repo name: `mindchoices_heroine_studio`.
- Bundle ID/applicationId: `com.mindchoices.heroinestudio`.
- Main stack: Flutter, Bloc, GetIt, GoRouter, Firebase Auth anonymous, Firestore, Firebase AI Logic / Gemini.
- AI generates only personalized text, not images.
- Images are static local assets in the MVP.
- The app must work without secrets using a mock AI provider fallback.
- No API keys or secrets may be committed.
- UI implementation must match the Stitch design direction closely, including typography, spacing, controls, motion, and screen structure.
- All visible text must use app theme or named text styles derived from the design system.
- Actual buttons and tappable controls must provide Material ripple feedback through Material buttons or `Material` plus `InkWell` / `InkResponse`.
- Step changes, selected states, progress/checkpoint changes, loading, and save confirmation should use smooth restrained animations.
- Keep the architecture simple and test-task friendly.
