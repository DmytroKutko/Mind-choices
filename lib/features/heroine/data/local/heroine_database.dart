import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';

import '../../domain/heroine_models.dart';

part 'heroine_database.g.dart';

@DataClassName('HeroineProfileRow')
class HeroineProfileRows extends Table {
  @override
  String get tableName => 'heroine_profiles';

  TextColumn get id => text()();
  TextColumn get ownerUid => text().nullable()();
  TextColumn get name => text()();
  TextColumn get archetype => text()();
  TextColumn get subtitle => text()();
  TextColumn get traitsJson => text()();
  TextColumn get imageAsset => text()();
  TextColumn get profileText => text()();
  TextColumn get greeting => text()();
  TextColumn get storySeed => text()();
  IntColumn get ageIndex => integer()();
  TextColumn get ageLabel => text()();
  IntColumn get genderIndex => integer()();
  TextColumn get genderLabel => text()();
  IntColumn get focusIndex => integer()();
  TextColumn get focusLabel => text()();
  IntColumn get moodIndex => integer()();
  TextColumn get moodLabel => text()();
  IntColumn get aestheticIndex => integer()();
  TextColumn get aestheticLabel => text()();
  IntColumn get visualStyleIndex => integer()();
  TextColumn get visualStyleLabel => text()();
  IntColumn get archetypeIndex => integer()();
  TextColumn get archetypeLabel => text()();
  IntColumn get paletteIndex => integer()();
  IntColumn get paletteColorValue => integer()();
  TextColumn get selectedTraitIndexesJson => text()();
  TextColumn get selectedTraitLabelsJson => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get syncedAt => dateTime().nullable()();
  BoolColumn get pendingSync => boolean().withDefault(const Constant(true))();
  TextColumn get lastSyncError => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(tables: [HeroineProfileRows])
final class HeroineDatabase extends _$HeroineDatabase {
  HeroineDatabase(super.executor);

  factory HeroineDatabase.open() {
    return HeroineDatabase(
      SqfliteQueryExecutor.inDatabaseFolder(
        path: 'mindchoices_heroine_studio.sqlite',
      ),
    );
  }

  @override
  int get schemaVersion => 1;

  Stream<List<SavedHeroine>> watchSavedHeroines() {
    final query = select(heroineProfileRows)
      ..orderBy([
        (row) =>
            OrderingTerm(expression: row.updatedAt, mode: OrderingMode.desc),
      ]);

    return query.watch().map((rows) => rows.map(_rowToModel).toList());
  }

  Future<List<SavedHeroine>> loadSavedHeroines() async {
    final query = select(heroineProfileRows)
      ..orderBy([
        (row) =>
            OrderingTerm(expression: row.updatedAt, mode: OrderingMode.desc),
      ]);

    final rows = await query.get();
    return rows.map(_rowToModel).toList();
  }

  Future<List<SavedHeroine>> loadPendingSyncHeroines() async {
    final rows = await (select(
      heroineProfileRows,
    )..where((row) => row.pendingSync.equals(true))).get();

    return rows.map(_rowToModel).toList();
  }

  Future<void> upsertHeroine(SavedHeroine heroine) {
    return into(
      heroineProfileRows,
    ).insertOnConflictUpdate(_modelToCompanion(heroine));
  }

  Future<void> upsertHeroines(List<SavedHeroine> heroines) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        heroineProfileRows,
        heroines.map(_modelToCompanion).toList(),
      );
    });
  }

  Future<void> markHeroineSynced({
    required String id,
    required String ownerUid,
    required DateTime syncedAt,
  }) {
    return (update(
      heroineProfileRows,
    )..where((row) => row.id.equals(id))).write(
      HeroineProfileRowsCompanion(
        ownerUid: Value(ownerUid),
        syncedAt: Value(syncedAt),
        pendingSync: const Value(false),
        lastSyncError: const Value(null),
      ),
    );
  }

  Future<void> markHeroineSyncFailed({
    required String id,
    required String message,
  }) {
    return (update(
      heroineProfileRows,
    )..where((row) => row.id.equals(id))).write(
      HeroineProfileRowsCompanion(
        pendingSync: const Value(true),
        lastSyncError: Value(message),
      ),
    );
  }

  Future<void> deleteHeroine(String id) {
    return (delete(heroineProfileRows)..where((row) => row.id.equals(id))).go();
  }

  SavedHeroine _rowToModel(HeroineProfileRow row) {
    return SavedHeroine(
      id: row.id,
      ownerUid: row.ownerUid,
      profile: HeroineProfile(
        name: row.name,
        archetype: row.archetype,
        subtitle: row.subtitle,
        traits: _decodeStringList(row.traitsJson),
        profile: row.profileText,
        greeting: row.greeting,
        storySeed: row.storySeed,
        imageAsset: row.imageAsset,
      ),
      selections: HeroineSelections(
        ageIndex: row.ageIndex,
        ageLabel: row.ageLabel,
        genderIndex: row.genderIndex,
        genderLabel: row.genderLabel,
        focusIndex: row.focusIndex,
        focusLabel: row.focusLabel,
        moodIndex: row.moodIndex,
        moodLabel: row.moodLabel,
        aestheticIndex: row.aestheticIndex,
        aestheticLabel: row.aestheticLabel,
        visualStyleIndex: row.visualStyleIndex,
        visualStyleLabel: row.visualStyleLabel,
        archetypeIndex: row.archetypeIndex,
        archetypeLabel: row.archetypeLabel,
        paletteIndex: row.paletteIndex,
        paletteColorValue: row.paletteColorValue,
        selectedTraitIndexes: _decodeIntList(row.selectedTraitIndexesJson),
        selectedTraitLabels: _decodeStringList(row.selectedTraitLabelsJson),
      ),
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      syncedAt: row.syncedAt,
      pendingSync: row.pendingSync,
      lastSyncError: row.lastSyncError,
    );
  }

  HeroineProfileRowsCompanion _modelToCompanion(SavedHeroine heroine) {
    final profile = heroine.profile;
    final selections = heroine.selections;

    return HeroineProfileRowsCompanion.insert(
      id: heroine.id,
      ownerUid: Value(heroine.ownerUid),
      name: profile.name,
      archetype: profile.archetype,
      subtitle: profile.subtitle,
      traitsJson: jsonEncode(profile.traits),
      imageAsset: profile.imageAsset,
      profileText: profile.profile,
      greeting: profile.greeting,
      storySeed: profile.storySeed,
      ageIndex: selections.ageIndex,
      ageLabel: selections.ageLabel,
      genderIndex: selections.genderIndex,
      genderLabel: selections.genderLabel,
      focusIndex: selections.focusIndex,
      focusLabel: selections.focusLabel,
      moodIndex: selections.moodIndex,
      moodLabel: selections.moodLabel,
      aestheticIndex: selections.aestheticIndex,
      aestheticLabel: selections.aestheticLabel,
      visualStyleIndex: selections.visualStyleIndex,
      visualStyleLabel: selections.visualStyleLabel,
      archetypeIndex: selections.archetypeIndex,
      archetypeLabel: selections.archetypeLabel,
      paletteIndex: selections.paletteIndex,
      paletteColorValue: selections.paletteColorValue,
      selectedTraitIndexesJson: jsonEncode(selections.selectedTraitIndexes),
      selectedTraitLabelsJson: jsonEncode(selections.selectedTraitLabels),
      createdAt: heroine.createdAt,
      updatedAt: heroine.updatedAt,
      syncedAt: Value(heroine.syncedAt),
      pendingSync: Value(heroine.pendingSync),
      lastSyncError: Value(heroine.lastSyncError),
    );
  }

  List<String> _decodeStringList(String source) {
    final decoded = jsonDecode(source);
    if (decoded is List) {
      return decoded.whereType<String>().toList();
    }

    return const [];
  }

  List<int> _decodeIntList(String source) {
    final decoded = jsonDecode(source);
    if (decoded is List) {
      return decoded.whereType<num>().map((value) => value.toInt()).toList();
    }

    return const [];
  }
}
