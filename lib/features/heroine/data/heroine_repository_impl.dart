import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/heroine_models.dart';
import '../domain/heroine_repository.dart';
import 'local/heroine_database.dart';

final class HybridHeroineRepository implements HeroineRepository {
  HybridHeroineRepository({
    required HeroineDatabase database,
    required FirebaseAuth firebaseAuth,
    required FirebaseFirestore firestore,
  }) : this._(
         database: database,
         firebaseAuth: firebaseAuth,
         firestore: firestore,
       );

  HybridHeroineRepository._({
    required this._database,
    required this._firebaseAuth,
    required this._firestore,
  });

  final HeroineDatabase _database;
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  @override
  Stream<List<SavedHeroine>> watchSavedHeroines() {
    return _database.watchSavedHeroines();
  }

  @override
  Future<List<SavedHeroine>> loadSavedHeroines() {
    return _database.loadSavedHeroines();
  }

  @override
  Future<SavedHeroine> saveGeneratedHeroine({
    required HeroineProfile profile,
    required HeroineSelections selections,
  }) async {
    final now = DateTime.now().toUtc();
    final heroine = SavedHeroine(
      id: _createLocalId(now),
      profile: profile,
      selections: selections,
      createdAt: now,
      updatedAt: now,
      pendingSync: true,
    );

    await _database.upsertHeroine(heroine);
    await _syncHeroine(heroine);

    return heroine;
  }

  @override
  Future<void> refreshFromRemote() async {
    final user = await _ensureUser();
    if (user == null) {
      return;
    }

    try {
      final snapshot = await _profilesRef(
        user.uid,
      ).orderBy('updatedAt', descending: true).get();
      final remoteHeroines = snapshot.docs
          .map((doc) => _fromFirestore(doc.id, user.uid, doc.data()))
          .toList();

      if (remoteHeroines.isNotEmpty) {
        await _database.upsertHeroines(remoteHeroines);
      }

      await _syncPending(user.uid);
    } on Object {
      return;
    }
  }

  @override
  Future<void> deleteHeroine(String id) async {
    await _database.deleteHeroine(id);

    final user = await _ensureUser();
    if (user == null) {
      return;
    }

    try {
      await _profilesRef(user.uid).doc(id).delete();
    } on Object {
      return;
    }
  }

  Future<User?> _ensureUser() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      return currentUser;
    }

    try {
      final credential = await _firebaseAuth.signInAnonymously();
      return credential.user;
    } on Object {
      return null;
    }
  }

  Future<void> _syncPending(String ownerUid) async {
    final pending = await _database.loadPendingSyncHeroines();
    for (final heroine in pending) {
      await _syncHeroine(
        heroine.copyWith(ownerUid: ownerUid),
        userId: ownerUid,
      );
    }
  }

  Future<void> _syncHeroine(SavedHeroine heroine, {String? userId}) async {
    final ownerUid = userId ?? (await _ensureUser())?.uid;
    if (ownerUid == null) {
      await _database.markHeroineSyncFailed(
        id: heroine.id,
        message: 'Firebase Auth is unavailable.',
      );
      return;
    }

    final remoteHeroine = heroine.copyWith(ownerUid: ownerUid);

    try {
      await _profilesRef(
        ownerUid,
      ).doc(remoteHeroine.id).set(_toFirestore(remoteHeroine));
      await _database.markHeroineSynced(
        id: remoteHeroine.id,
        ownerUid: ownerUid,
        syncedAt: DateTime.now().toUtc(),
      );
    } on Object catch (error) {
      await _database.markHeroineSyncFailed(
        id: remoteHeroine.id,
        message: _syncErrorMessage(error),
      );
    }
  }

  CollectionReference<Map<String, dynamic>> _profilesRef(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('heroine_profiles');
  }

  Map<String, dynamic> _toFirestore(SavedHeroine heroine) {
    final profile = heroine.profile;
    final selections = heroine.selections;

    return {
      'ownerUid': heroine.ownerUid,
      'name': profile.name,
      'archetype': profile.archetype,
      'subtitle': profile.subtitle,
      'traits': profile.traits,
      'imageAsset': profile.imageAsset,
      'profile': profile.profile,
      'greeting': profile.greeting,
      'storySeed': profile.storySeed,
      'selections': {
        'ageIndex': selections.ageIndex,
        'ageLabel': selections.ageLabel,
        'genderIndex': selections.genderIndex,
        'genderLabel': selections.genderLabel,
        'focusIndex': selections.focusIndex,
        'focusLabel': selections.focusLabel,
        'moodIndex': selections.moodIndex,
        'moodLabel': selections.moodLabel,
        'aestheticIndex': selections.aestheticIndex,
        'aestheticLabel': selections.aestheticLabel,
        'visualStyleIndex': selections.visualStyleIndex,
        'visualStyleLabel': selections.visualStyleLabel,
        'archetypeIndex': selections.archetypeIndex,
        'archetypeLabel': selections.archetypeLabel,
        'paletteIndex': selections.paletteIndex,
        'paletteColorValue': selections.paletteColorValue,
        'selectedTraitIndexes': selections.selectedTraitIndexes,
        'selectedTraitLabels': selections.selectedTraitLabels,
      },
      'createdAt': Timestamp.fromDate(heroine.createdAt),
      'updatedAt': Timestamp.fromDate(heroine.updatedAt),
    };
  }

  SavedHeroine _fromFirestore(
    String id,
    String ownerUid,
    Map<String, dynamic> data,
  ) {
    final selections = _mapValue(data['selections']);
    final createdAt = _timestampValue(data['createdAt']) ?? DateTime.now();
    final updatedAt = _timestampValue(data['updatedAt']) ?? createdAt;

    return SavedHeroine(
      id: id,
      ownerUid: ownerUid,
      profile: HeroineProfile(
        name: _stringValue(data['name']),
        archetype: _stringValue(data['archetype']),
        subtitle: _stringValue(data['subtitle']),
        traits: _stringListValue(data['traits']),
        imageAsset: _stringValue(data['imageAsset']),
        profile: _stringValue(data['profile']),
        greeting: _stringValue(data['greeting']),
        storySeed: _stringValue(data['storySeed']),
      ),
      selections: HeroineSelections(
        ageIndex: _intValue(selections['ageIndex']),
        ageLabel: _stringValue(selections['ageLabel']),
        genderIndex: _intValue(selections['genderIndex']),
        genderLabel: _stringValue(selections['genderLabel']),
        focusIndex: _intValue(selections['focusIndex']),
        focusLabel: _stringValue(selections['focusLabel']),
        moodIndex: _intValue(selections['moodIndex']),
        moodLabel: _stringValue(selections['moodLabel']),
        aestheticIndex: _intValue(selections['aestheticIndex']),
        aestheticLabel: _stringValue(selections['aestheticLabel']),
        visualStyleIndex: _intValue(selections['visualStyleIndex']),
        visualStyleLabel: _stringValue(selections['visualStyleLabel']),
        archetypeIndex: _intValue(selections['archetypeIndex']),
        archetypeLabel: _stringValue(selections['archetypeLabel']),
        paletteIndex: _intValue(selections['paletteIndex']),
        paletteColorValue: _intValue(selections['paletteColorValue']),
        selectedTraitIndexes: _intListValue(selections['selectedTraitIndexes']),
        selectedTraitLabels: _stringListValue(
          selections['selectedTraitLabels'],
        ),
      ),
      createdAt: createdAt,
      updatedAt: updatedAt,
      syncedAt: DateTime.now().toUtc(),
      pendingSync: false,
    );
  }

  String _createLocalId(DateTime now) {
    return 'heroine_${now.microsecondsSinceEpoch}';
  }

  Map<String, dynamic> _mapValue(Object? value) {
    if (value is Map<String, dynamic>) {
      return value;
    }

    if (value is Map) {
      return value.map((key, value) => MapEntry(key.toString(), value));
    }

    return const {};
  }

  String _stringValue(Object? value) => value is String ? value : '';

  int _intValue(Object? value) => value is num ? value.toInt() : 0;

  DateTime? _timestampValue(Object? value) {
    if (value is Timestamp) {
      return value.toDate().toUtc();
    }

    if (value is DateTime) {
      return value.toUtc();
    }

    return null;
  }

  List<String> _stringListValue(Object? value) {
    if (value is List) {
      return value.whereType<String>().toList();
    }

    return const [];
  }

  List<int> _intListValue(Object? value) {
    if (value is List) {
      return value.whereType<num>().map((item) => item.toInt()).toList();
    }

    return const [];
  }

  String _syncErrorMessage(Object error) {
    if (error is FirebaseException) {
      return error.message ?? error.code;
    }

    return error.toString();
  }
}
