# Firestore Security Findings

## Target

- Firebase project: configured through local Firebase CLI project settings.
- Database: `(default)`
- Edition: Standard
- Location: `nam5`

## Client Access Patterns

- Authentication: Firebase Auth anonymous sign-in.
- Collection path: `users/{uid}/heroine_profiles/{profileId}`.
- Read query: collection read scoped to the authenticated user, ordered by
  `updatedAt` descending.
- Create/update: generated heroine profile documents owned by the signed-in
  user.
- Delete: owner deletes their own heroine profile.

No public Firestore reads are required.

## Data Model

### `users/{uid}/heroine_profiles/{profileId}`

Required fields:

- `ownerUid`: string, must match `{uid}` and `request.auth.uid`.
- `name`: string, 1-32 chars.
- `archetype`: string, 1-40 chars.
- `subtitle`: string, 1-80 chars.
- `traits`: list, 1-3 allowed trait strings.
- `imageAsset`: string, local asset path, max 140 chars.
- `profile`: string, 1-1200 chars.
- `greeting`: string, 1-500 chars.
- `storySeed`: string, 1-900 chars.
- `selections`: map of all step choices.
- `createdAt`: timestamp.
- `updatedAt`: timestamp.

`ownerUid` and `createdAt` are immutable on update. `updatedAt` must not be
earlier than `createdAt`.

## Indexes

The app only uses `orderBy('updatedAt', descending: true)` inside a user-owned
subcollection. Standard Firestore single-field indexes cover this query, so no
composite index is currently required.

## Devil's Advocate Review

- Public list exploit: denied by default and owner-only read rule.
- Unauthorized read/write: denied because `{uid}` must equal `request.auth.uid`.
- Update bypass: create and update both call the same profile validator.
- Ownership hijacking: `ownerUid` must equal path uid and auth uid; immutable on
  update.
- Immutable field modification: `createdAt` and `ownerUid` are locked on update.
- Type juggling: all scalar and map fields are type-checked.
- Required field omission: profile validator requires the full field set.
- Schema pollution: document and `selections` map both use `hasOnly`.
- Resource exhaustion: every string has a maximum length and lists are bounded.
- Timestamp manipulation: `updatedAt` cannot be before `createdAt`.
- Query mismatch: owner-scoped collection read supports the app query.

These findings support prototype owner-scoped rules for the current MVP data
model. They should be revisited when shared profiles, account linking, remote
delete queues, or server-side generation are added.
