// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heroine_database.dart';

// ignore_for_file: type=lint
class $HeroineProfileRowsTable extends HeroineProfileRows
    with TableInfo<$HeroineProfileRowsTable, HeroineProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HeroineProfileRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerUidMeta = const VerificationMeta(
    'ownerUid',
  );
  @override
  late final GeneratedColumn<String> ownerUid = GeneratedColumn<String>(
    'owner_uid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _archetypeMeta = const VerificationMeta(
    'archetype',
  );
  @override
  late final GeneratedColumn<String> archetype = GeneratedColumn<String>(
    'archetype',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtitleMeta = const VerificationMeta(
    'subtitle',
  );
  @override
  late final GeneratedColumn<String> subtitle = GeneratedColumn<String>(
    'subtitle',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _traitsJsonMeta = const VerificationMeta(
    'traitsJson',
  );
  @override
  late final GeneratedColumn<String> traitsJson = GeneratedColumn<String>(
    'traits_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageAssetMeta = const VerificationMeta(
    'imageAsset',
  );
  @override
  late final GeneratedColumn<String> imageAsset = GeneratedColumn<String>(
    'image_asset',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _profileTextMeta = const VerificationMeta(
    'profileText',
  );
  @override
  late final GeneratedColumn<String> profileText = GeneratedColumn<String>(
    'profile_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _greetingMeta = const VerificationMeta(
    'greeting',
  );
  @override
  late final GeneratedColumn<String> greeting = GeneratedColumn<String>(
    'greeting',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _storySeedMeta = const VerificationMeta(
    'storySeed',
  );
  @override
  late final GeneratedColumn<String> storySeed = GeneratedColumn<String>(
    'story_seed',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageIndexMeta = const VerificationMeta(
    'ageIndex',
  );
  @override
  late final GeneratedColumn<int> ageIndex = GeneratedColumn<int>(
    'age_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageLabelMeta = const VerificationMeta(
    'ageLabel',
  );
  @override
  late final GeneratedColumn<String> ageLabel = GeneratedColumn<String>(
    'age_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genderIndexMeta = const VerificationMeta(
    'genderIndex',
  );
  @override
  late final GeneratedColumn<int> genderIndex = GeneratedColumn<int>(
    'gender_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _genderLabelMeta = const VerificationMeta(
    'genderLabel',
  );
  @override
  late final GeneratedColumn<String> genderLabel = GeneratedColumn<String>(
    'gender_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _focusIndexMeta = const VerificationMeta(
    'focusIndex',
  );
  @override
  late final GeneratedColumn<int> focusIndex = GeneratedColumn<int>(
    'focus_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _focusLabelMeta = const VerificationMeta(
    'focusLabel',
  );
  @override
  late final GeneratedColumn<String> focusLabel = GeneratedColumn<String>(
    'focus_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodIndexMeta = const VerificationMeta(
    'moodIndex',
  );
  @override
  late final GeneratedColumn<int> moodIndex = GeneratedColumn<int>(
    'mood_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _moodLabelMeta = const VerificationMeta(
    'moodLabel',
  );
  @override
  late final GeneratedColumn<String> moodLabel = GeneratedColumn<String>(
    'mood_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aestheticIndexMeta = const VerificationMeta(
    'aestheticIndex',
  );
  @override
  late final GeneratedColumn<int> aestheticIndex = GeneratedColumn<int>(
    'aesthetic_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aestheticLabelMeta = const VerificationMeta(
    'aestheticLabel',
  );
  @override
  late final GeneratedColumn<String> aestheticLabel = GeneratedColumn<String>(
    'aesthetic_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _visualStyleIndexMeta = const VerificationMeta(
    'visualStyleIndex',
  );
  @override
  late final GeneratedColumn<int> visualStyleIndex = GeneratedColumn<int>(
    'visual_style_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _visualStyleLabelMeta = const VerificationMeta(
    'visualStyleLabel',
  );
  @override
  late final GeneratedColumn<String> visualStyleLabel = GeneratedColumn<String>(
    'visual_style_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _archetypeIndexMeta = const VerificationMeta(
    'archetypeIndex',
  );
  @override
  late final GeneratedColumn<int> archetypeIndex = GeneratedColumn<int>(
    'archetype_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _archetypeLabelMeta = const VerificationMeta(
    'archetypeLabel',
  );
  @override
  late final GeneratedColumn<String> archetypeLabel = GeneratedColumn<String>(
    'archetype_label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paletteIndexMeta = const VerificationMeta(
    'paletteIndex',
  );
  @override
  late final GeneratedColumn<int> paletteIndex = GeneratedColumn<int>(
    'palette_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _paletteColorValueMeta = const VerificationMeta(
    'paletteColorValue',
  );
  @override
  late final GeneratedColumn<int> paletteColorValue = GeneratedColumn<int>(
    'palette_color_value',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedTraitIndexesJsonMeta =
      const VerificationMeta('selectedTraitIndexesJson');
  @override
  late final GeneratedColumn<String> selectedTraitIndexesJson =
      GeneratedColumn<String>(
        'selected_trait_indexes_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _selectedTraitLabelsJsonMeta =
      const VerificationMeta('selectedTraitLabelsJson');
  @override
  late final GeneratedColumn<String> selectedTraitLabelsJson =
      GeneratedColumn<String>(
        'selected_trait_labels_json',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pendingSyncMeta = const VerificationMeta(
    'pendingSync',
  );
  @override
  late final GeneratedColumn<bool> pendingSync = GeneratedColumn<bool>(
    'pending_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pending_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _lastSyncErrorMeta = const VerificationMeta(
    'lastSyncError',
  );
  @override
  late final GeneratedColumn<String> lastSyncError = GeneratedColumn<String>(
    'last_sync_error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerUid,
    name,
    archetype,
    subtitle,
    traitsJson,
    imageAsset,
    profileText,
    greeting,
    storySeed,
    ageIndex,
    ageLabel,
    genderIndex,
    genderLabel,
    focusIndex,
    focusLabel,
    moodIndex,
    moodLabel,
    aestheticIndex,
    aestheticLabel,
    visualStyleIndex,
    visualStyleLabel,
    archetypeIndex,
    archetypeLabel,
    paletteIndex,
    paletteColorValue,
    selectedTraitIndexesJson,
    selectedTraitLabelsJson,
    createdAt,
    updatedAt,
    syncedAt,
    pendingSync,
    lastSyncError,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'heroine_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<HeroineProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_uid')) {
      context.handle(
        _ownerUidMeta,
        ownerUid.isAcceptableOrUnknown(data['owner_uid']!, _ownerUidMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('archetype')) {
      context.handle(
        _archetypeMeta,
        archetype.isAcceptableOrUnknown(data['archetype']!, _archetypeMeta),
      );
    } else if (isInserting) {
      context.missing(_archetypeMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(
        _subtitleMeta,
        subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta),
      );
    } else if (isInserting) {
      context.missing(_subtitleMeta);
    }
    if (data.containsKey('traits_json')) {
      context.handle(
        _traitsJsonMeta,
        traitsJson.isAcceptableOrUnknown(data['traits_json']!, _traitsJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_traitsJsonMeta);
    }
    if (data.containsKey('image_asset')) {
      context.handle(
        _imageAssetMeta,
        imageAsset.isAcceptableOrUnknown(data['image_asset']!, _imageAssetMeta),
      );
    } else if (isInserting) {
      context.missing(_imageAssetMeta);
    }
    if (data.containsKey('profile_text')) {
      context.handle(
        _profileTextMeta,
        profileText.isAcceptableOrUnknown(
          data['profile_text']!,
          _profileTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_profileTextMeta);
    }
    if (data.containsKey('greeting')) {
      context.handle(
        _greetingMeta,
        greeting.isAcceptableOrUnknown(data['greeting']!, _greetingMeta),
      );
    } else if (isInserting) {
      context.missing(_greetingMeta);
    }
    if (data.containsKey('story_seed')) {
      context.handle(
        _storySeedMeta,
        storySeed.isAcceptableOrUnknown(data['story_seed']!, _storySeedMeta),
      );
    } else if (isInserting) {
      context.missing(_storySeedMeta);
    }
    if (data.containsKey('age_index')) {
      context.handle(
        _ageIndexMeta,
        ageIndex.isAcceptableOrUnknown(data['age_index']!, _ageIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_ageIndexMeta);
    }
    if (data.containsKey('age_label')) {
      context.handle(
        _ageLabelMeta,
        ageLabel.isAcceptableOrUnknown(data['age_label']!, _ageLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_ageLabelMeta);
    }
    if (data.containsKey('gender_index')) {
      context.handle(
        _genderIndexMeta,
        genderIndex.isAcceptableOrUnknown(
          data['gender_index']!,
          _genderIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_genderIndexMeta);
    }
    if (data.containsKey('gender_label')) {
      context.handle(
        _genderLabelMeta,
        genderLabel.isAcceptableOrUnknown(
          data['gender_label']!,
          _genderLabelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_genderLabelMeta);
    }
    if (data.containsKey('focus_index')) {
      context.handle(
        _focusIndexMeta,
        focusIndex.isAcceptableOrUnknown(data['focus_index']!, _focusIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_focusIndexMeta);
    }
    if (data.containsKey('focus_label')) {
      context.handle(
        _focusLabelMeta,
        focusLabel.isAcceptableOrUnknown(data['focus_label']!, _focusLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_focusLabelMeta);
    }
    if (data.containsKey('mood_index')) {
      context.handle(
        _moodIndexMeta,
        moodIndex.isAcceptableOrUnknown(data['mood_index']!, _moodIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_moodIndexMeta);
    }
    if (data.containsKey('mood_label')) {
      context.handle(
        _moodLabelMeta,
        moodLabel.isAcceptableOrUnknown(data['mood_label']!, _moodLabelMeta),
      );
    } else if (isInserting) {
      context.missing(_moodLabelMeta);
    }
    if (data.containsKey('aesthetic_index')) {
      context.handle(
        _aestheticIndexMeta,
        aestheticIndex.isAcceptableOrUnknown(
          data['aesthetic_index']!,
          _aestheticIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_aestheticIndexMeta);
    }
    if (data.containsKey('aesthetic_label')) {
      context.handle(
        _aestheticLabelMeta,
        aestheticLabel.isAcceptableOrUnknown(
          data['aesthetic_label']!,
          _aestheticLabelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_aestheticLabelMeta);
    }
    if (data.containsKey('visual_style_index')) {
      context.handle(
        _visualStyleIndexMeta,
        visualStyleIndex.isAcceptableOrUnknown(
          data['visual_style_index']!,
          _visualStyleIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_visualStyleIndexMeta);
    }
    if (data.containsKey('visual_style_label')) {
      context.handle(
        _visualStyleLabelMeta,
        visualStyleLabel.isAcceptableOrUnknown(
          data['visual_style_label']!,
          _visualStyleLabelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_visualStyleLabelMeta);
    }
    if (data.containsKey('archetype_index')) {
      context.handle(
        _archetypeIndexMeta,
        archetypeIndex.isAcceptableOrUnknown(
          data['archetype_index']!,
          _archetypeIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_archetypeIndexMeta);
    }
    if (data.containsKey('archetype_label')) {
      context.handle(
        _archetypeLabelMeta,
        archetypeLabel.isAcceptableOrUnknown(
          data['archetype_label']!,
          _archetypeLabelMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_archetypeLabelMeta);
    }
    if (data.containsKey('palette_index')) {
      context.handle(
        _paletteIndexMeta,
        paletteIndex.isAcceptableOrUnknown(
          data['palette_index']!,
          _paletteIndexMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paletteIndexMeta);
    }
    if (data.containsKey('palette_color_value')) {
      context.handle(
        _paletteColorValueMeta,
        paletteColorValue.isAcceptableOrUnknown(
          data['palette_color_value']!,
          _paletteColorValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_paletteColorValueMeta);
    }
    if (data.containsKey('selected_trait_indexes_json')) {
      context.handle(
        _selectedTraitIndexesJsonMeta,
        selectedTraitIndexesJson.isAcceptableOrUnknown(
          data['selected_trait_indexes_json']!,
          _selectedTraitIndexesJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectedTraitIndexesJsonMeta);
    }
    if (data.containsKey('selected_trait_labels_json')) {
      context.handle(
        _selectedTraitLabelsJsonMeta,
        selectedTraitLabelsJson.isAcceptableOrUnknown(
          data['selected_trait_labels_json']!,
          _selectedTraitLabelsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_selectedTraitLabelsJsonMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    }
    if (data.containsKey('pending_sync')) {
      context.handle(
        _pendingSyncMeta,
        pendingSync.isAcceptableOrUnknown(
          data['pending_sync']!,
          _pendingSyncMeta,
        ),
      );
    }
    if (data.containsKey('last_sync_error')) {
      context.handle(
        _lastSyncErrorMeta,
        lastSyncError.isAcceptableOrUnknown(
          data['last_sync_error']!,
          _lastSyncErrorMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HeroineProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HeroineProfileRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_uid'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      archetype: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archetype'],
      )!,
      subtitle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subtitle'],
      )!,
      traitsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}traits_json'],
      )!,
      imageAsset: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_asset'],
      )!,
      profileText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}profile_text'],
      )!,
      greeting: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}greeting'],
      )!,
      storySeed: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}story_seed'],
      )!,
      ageIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age_index'],
      )!,
      ageLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}age_label'],
      )!,
      genderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}gender_index'],
      )!,
      genderLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}gender_label'],
      )!,
      focusIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}focus_index'],
      )!,
      focusLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}focus_label'],
      )!,
      moodIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mood_index'],
      )!,
      moodLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mood_label'],
      )!,
      aestheticIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}aesthetic_index'],
      )!,
      aestheticLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aesthetic_label'],
      )!,
      visualStyleIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}visual_style_index'],
      )!,
      visualStyleLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visual_style_label'],
      )!,
      archetypeIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}archetype_index'],
      )!,
      archetypeLabel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}archetype_label'],
      )!,
      paletteIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}palette_index'],
      )!,
      paletteColorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}palette_color_value'],
      )!,
      selectedTraitIndexesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_trait_indexes_json'],
      )!,
      selectedTraitLabelsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_trait_labels_json'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      ),
      pendingSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pending_sync'],
      )!,
      lastSyncError: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_sync_error'],
      ),
    );
  }

  @override
  $HeroineProfileRowsTable createAlias(String alias) {
    return $HeroineProfileRowsTable(attachedDatabase, alias);
  }
}

class HeroineProfileRow extends DataClass
    implements Insertable<HeroineProfileRow> {
  final String id;
  final String? ownerUid;
  final String name;
  final String archetype;
  final String subtitle;
  final String traitsJson;
  final String imageAsset;
  final String profileText;
  final String greeting;
  final String storySeed;
  final int ageIndex;
  final String ageLabel;
  final int genderIndex;
  final String genderLabel;
  final int focusIndex;
  final String focusLabel;
  final int moodIndex;
  final String moodLabel;
  final int aestheticIndex;
  final String aestheticLabel;
  final int visualStyleIndex;
  final String visualStyleLabel;
  final int archetypeIndex;
  final String archetypeLabel;
  final int paletteIndex;
  final int paletteColorValue;
  final String selectedTraitIndexesJson;
  final String selectedTraitLabelsJson;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? syncedAt;
  final bool pendingSync;
  final String? lastSyncError;
  const HeroineProfileRow({
    required this.id,
    this.ownerUid,
    required this.name,
    required this.archetype,
    required this.subtitle,
    required this.traitsJson,
    required this.imageAsset,
    required this.profileText,
    required this.greeting,
    required this.storySeed,
    required this.ageIndex,
    required this.ageLabel,
    required this.genderIndex,
    required this.genderLabel,
    required this.focusIndex,
    required this.focusLabel,
    required this.moodIndex,
    required this.moodLabel,
    required this.aestheticIndex,
    required this.aestheticLabel,
    required this.visualStyleIndex,
    required this.visualStyleLabel,
    required this.archetypeIndex,
    required this.archetypeLabel,
    required this.paletteIndex,
    required this.paletteColorValue,
    required this.selectedTraitIndexesJson,
    required this.selectedTraitLabelsJson,
    required this.createdAt,
    required this.updatedAt,
    this.syncedAt,
    required this.pendingSync,
    this.lastSyncError,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || ownerUid != null) {
      map['owner_uid'] = Variable<String>(ownerUid);
    }
    map['name'] = Variable<String>(name);
    map['archetype'] = Variable<String>(archetype);
    map['subtitle'] = Variable<String>(subtitle);
    map['traits_json'] = Variable<String>(traitsJson);
    map['image_asset'] = Variable<String>(imageAsset);
    map['profile_text'] = Variable<String>(profileText);
    map['greeting'] = Variable<String>(greeting);
    map['story_seed'] = Variable<String>(storySeed);
    map['age_index'] = Variable<int>(ageIndex);
    map['age_label'] = Variable<String>(ageLabel);
    map['gender_index'] = Variable<int>(genderIndex);
    map['gender_label'] = Variable<String>(genderLabel);
    map['focus_index'] = Variable<int>(focusIndex);
    map['focus_label'] = Variable<String>(focusLabel);
    map['mood_index'] = Variable<int>(moodIndex);
    map['mood_label'] = Variable<String>(moodLabel);
    map['aesthetic_index'] = Variable<int>(aestheticIndex);
    map['aesthetic_label'] = Variable<String>(aestheticLabel);
    map['visual_style_index'] = Variable<int>(visualStyleIndex);
    map['visual_style_label'] = Variable<String>(visualStyleLabel);
    map['archetype_index'] = Variable<int>(archetypeIndex);
    map['archetype_label'] = Variable<String>(archetypeLabel);
    map['palette_index'] = Variable<int>(paletteIndex);
    map['palette_color_value'] = Variable<int>(paletteColorValue);
    map['selected_trait_indexes_json'] = Variable<String>(
      selectedTraitIndexesJson,
    );
    map['selected_trait_labels_json'] = Variable<String>(
      selectedTraitLabelsJson,
    );
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || syncedAt != null) {
      map['synced_at'] = Variable<DateTime>(syncedAt);
    }
    map['pending_sync'] = Variable<bool>(pendingSync);
    if (!nullToAbsent || lastSyncError != null) {
      map['last_sync_error'] = Variable<String>(lastSyncError);
    }
    return map;
  }

  HeroineProfileRowsCompanion toCompanion(bool nullToAbsent) {
    return HeroineProfileRowsCompanion(
      id: Value(id),
      ownerUid: ownerUid == null && nullToAbsent
          ? const Value.absent()
          : Value(ownerUid),
      name: Value(name),
      archetype: Value(archetype),
      subtitle: Value(subtitle),
      traitsJson: Value(traitsJson),
      imageAsset: Value(imageAsset),
      profileText: Value(profileText),
      greeting: Value(greeting),
      storySeed: Value(storySeed),
      ageIndex: Value(ageIndex),
      ageLabel: Value(ageLabel),
      genderIndex: Value(genderIndex),
      genderLabel: Value(genderLabel),
      focusIndex: Value(focusIndex),
      focusLabel: Value(focusLabel),
      moodIndex: Value(moodIndex),
      moodLabel: Value(moodLabel),
      aestheticIndex: Value(aestheticIndex),
      aestheticLabel: Value(aestheticLabel),
      visualStyleIndex: Value(visualStyleIndex),
      visualStyleLabel: Value(visualStyleLabel),
      archetypeIndex: Value(archetypeIndex),
      archetypeLabel: Value(archetypeLabel),
      paletteIndex: Value(paletteIndex),
      paletteColorValue: Value(paletteColorValue),
      selectedTraitIndexesJson: Value(selectedTraitIndexesJson),
      selectedTraitLabelsJson: Value(selectedTraitLabelsJson),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncedAt: syncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedAt),
      pendingSync: Value(pendingSync),
      lastSyncError: lastSyncError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncError),
    );
  }

  factory HeroineProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HeroineProfileRow(
      id: serializer.fromJson<String>(json['id']),
      ownerUid: serializer.fromJson<String?>(json['ownerUid']),
      name: serializer.fromJson<String>(json['name']),
      archetype: serializer.fromJson<String>(json['archetype']),
      subtitle: serializer.fromJson<String>(json['subtitle']),
      traitsJson: serializer.fromJson<String>(json['traitsJson']),
      imageAsset: serializer.fromJson<String>(json['imageAsset']),
      profileText: serializer.fromJson<String>(json['profileText']),
      greeting: serializer.fromJson<String>(json['greeting']),
      storySeed: serializer.fromJson<String>(json['storySeed']),
      ageIndex: serializer.fromJson<int>(json['ageIndex']),
      ageLabel: serializer.fromJson<String>(json['ageLabel']),
      genderIndex: serializer.fromJson<int>(json['genderIndex']),
      genderLabel: serializer.fromJson<String>(json['genderLabel']),
      focusIndex: serializer.fromJson<int>(json['focusIndex']),
      focusLabel: serializer.fromJson<String>(json['focusLabel']),
      moodIndex: serializer.fromJson<int>(json['moodIndex']),
      moodLabel: serializer.fromJson<String>(json['moodLabel']),
      aestheticIndex: serializer.fromJson<int>(json['aestheticIndex']),
      aestheticLabel: serializer.fromJson<String>(json['aestheticLabel']),
      visualStyleIndex: serializer.fromJson<int>(json['visualStyleIndex']),
      visualStyleLabel: serializer.fromJson<String>(json['visualStyleLabel']),
      archetypeIndex: serializer.fromJson<int>(json['archetypeIndex']),
      archetypeLabel: serializer.fromJson<String>(json['archetypeLabel']),
      paletteIndex: serializer.fromJson<int>(json['paletteIndex']),
      paletteColorValue: serializer.fromJson<int>(json['paletteColorValue']),
      selectedTraitIndexesJson: serializer.fromJson<String>(
        json['selectedTraitIndexesJson'],
      ),
      selectedTraitLabelsJson: serializer.fromJson<String>(
        json['selectedTraitLabelsJson'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncedAt: serializer.fromJson<DateTime?>(json['syncedAt']),
      pendingSync: serializer.fromJson<bool>(json['pendingSync']),
      lastSyncError: serializer.fromJson<String?>(json['lastSyncError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerUid': serializer.toJson<String?>(ownerUid),
      'name': serializer.toJson<String>(name),
      'archetype': serializer.toJson<String>(archetype),
      'subtitle': serializer.toJson<String>(subtitle),
      'traitsJson': serializer.toJson<String>(traitsJson),
      'imageAsset': serializer.toJson<String>(imageAsset),
      'profileText': serializer.toJson<String>(profileText),
      'greeting': serializer.toJson<String>(greeting),
      'storySeed': serializer.toJson<String>(storySeed),
      'ageIndex': serializer.toJson<int>(ageIndex),
      'ageLabel': serializer.toJson<String>(ageLabel),
      'genderIndex': serializer.toJson<int>(genderIndex),
      'genderLabel': serializer.toJson<String>(genderLabel),
      'focusIndex': serializer.toJson<int>(focusIndex),
      'focusLabel': serializer.toJson<String>(focusLabel),
      'moodIndex': serializer.toJson<int>(moodIndex),
      'moodLabel': serializer.toJson<String>(moodLabel),
      'aestheticIndex': serializer.toJson<int>(aestheticIndex),
      'aestheticLabel': serializer.toJson<String>(aestheticLabel),
      'visualStyleIndex': serializer.toJson<int>(visualStyleIndex),
      'visualStyleLabel': serializer.toJson<String>(visualStyleLabel),
      'archetypeIndex': serializer.toJson<int>(archetypeIndex),
      'archetypeLabel': serializer.toJson<String>(archetypeLabel),
      'paletteIndex': serializer.toJson<int>(paletteIndex),
      'paletteColorValue': serializer.toJson<int>(paletteColorValue),
      'selectedTraitIndexesJson': serializer.toJson<String>(
        selectedTraitIndexesJson,
      ),
      'selectedTraitLabelsJson': serializer.toJson<String>(
        selectedTraitLabelsJson,
      ),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncedAt': serializer.toJson<DateTime?>(syncedAt),
      'pendingSync': serializer.toJson<bool>(pendingSync),
      'lastSyncError': serializer.toJson<String?>(lastSyncError),
    };
  }

  HeroineProfileRow copyWith({
    String? id,
    Value<String?> ownerUid = const Value.absent(),
    String? name,
    String? archetype,
    String? subtitle,
    String? traitsJson,
    String? imageAsset,
    String? profileText,
    String? greeting,
    String? storySeed,
    int? ageIndex,
    String? ageLabel,
    int? genderIndex,
    String? genderLabel,
    int? focusIndex,
    String? focusLabel,
    int? moodIndex,
    String? moodLabel,
    int? aestheticIndex,
    String? aestheticLabel,
    int? visualStyleIndex,
    String? visualStyleLabel,
    int? archetypeIndex,
    String? archetypeLabel,
    int? paletteIndex,
    int? paletteColorValue,
    String? selectedTraitIndexesJson,
    String? selectedTraitLabelsJson,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> syncedAt = const Value.absent(),
    bool? pendingSync,
    Value<String?> lastSyncError = const Value.absent(),
  }) => HeroineProfileRow(
    id: id ?? this.id,
    ownerUid: ownerUid.present ? ownerUid.value : this.ownerUid,
    name: name ?? this.name,
    archetype: archetype ?? this.archetype,
    subtitle: subtitle ?? this.subtitle,
    traitsJson: traitsJson ?? this.traitsJson,
    imageAsset: imageAsset ?? this.imageAsset,
    profileText: profileText ?? this.profileText,
    greeting: greeting ?? this.greeting,
    storySeed: storySeed ?? this.storySeed,
    ageIndex: ageIndex ?? this.ageIndex,
    ageLabel: ageLabel ?? this.ageLabel,
    genderIndex: genderIndex ?? this.genderIndex,
    genderLabel: genderLabel ?? this.genderLabel,
    focusIndex: focusIndex ?? this.focusIndex,
    focusLabel: focusLabel ?? this.focusLabel,
    moodIndex: moodIndex ?? this.moodIndex,
    moodLabel: moodLabel ?? this.moodLabel,
    aestheticIndex: aestheticIndex ?? this.aestheticIndex,
    aestheticLabel: aestheticLabel ?? this.aestheticLabel,
    visualStyleIndex: visualStyleIndex ?? this.visualStyleIndex,
    visualStyleLabel: visualStyleLabel ?? this.visualStyleLabel,
    archetypeIndex: archetypeIndex ?? this.archetypeIndex,
    archetypeLabel: archetypeLabel ?? this.archetypeLabel,
    paletteIndex: paletteIndex ?? this.paletteIndex,
    paletteColorValue: paletteColorValue ?? this.paletteColorValue,
    selectedTraitIndexesJson:
        selectedTraitIndexesJson ?? this.selectedTraitIndexesJson,
    selectedTraitLabelsJson:
        selectedTraitLabelsJson ?? this.selectedTraitLabelsJson,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncedAt: syncedAt.present ? syncedAt.value : this.syncedAt,
    pendingSync: pendingSync ?? this.pendingSync,
    lastSyncError: lastSyncError.present
        ? lastSyncError.value
        : this.lastSyncError,
  );
  HeroineProfileRow copyWithCompanion(HeroineProfileRowsCompanion data) {
    return HeroineProfileRow(
      id: data.id.present ? data.id.value : this.id,
      ownerUid: data.ownerUid.present ? data.ownerUid.value : this.ownerUid,
      name: data.name.present ? data.name.value : this.name,
      archetype: data.archetype.present ? data.archetype.value : this.archetype,
      subtitle: data.subtitle.present ? data.subtitle.value : this.subtitle,
      traitsJson: data.traitsJson.present
          ? data.traitsJson.value
          : this.traitsJson,
      imageAsset: data.imageAsset.present
          ? data.imageAsset.value
          : this.imageAsset,
      profileText: data.profileText.present
          ? data.profileText.value
          : this.profileText,
      greeting: data.greeting.present ? data.greeting.value : this.greeting,
      storySeed: data.storySeed.present ? data.storySeed.value : this.storySeed,
      ageIndex: data.ageIndex.present ? data.ageIndex.value : this.ageIndex,
      ageLabel: data.ageLabel.present ? data.ageLabel.value : this.ageLabel,
      genderIndex: data.genderIndex.present
          ? data.genderIndex.value
          : this.genderIndex,
      genderLabel: data.genderLabel.present
          ? data.genderLabel.value
          : this.genderLabel,
      focusIndex: data.focusIndex.present
          ? data.focusIndex.value
          : this.focusIndex,
      focusLabel: data.focusLabel.present
          ? data.focusLabel.value
          : this.focusLabel,
      moodIndex: data.moodIndex.present ? data.moodIndex.value : this.moodIndex,
      moodLabel: data.moodLabel.present ? data.moodLabel.value : this.moodLabel,
      aestheticIndex: data.aestheticIndex.present
          ? data.aestheticIndex.value
          : this.aestheticIndex,
      aestheticLabel: data.aestheticLabel.present
          ? data.aestheticLabel.value
          : this.aestheticLabel,
      visualStyleIndex: data.visualStyleIndex.present
          ? data.visualStyleIndex.value
          : this.visualStyleIndex,
      visualStyleLabel: data.visualStyleLabel.present
          ? data.visualStyleLabel.value
          : this.visualStyleLabel,
      archetypeIndex: data.archetypeIndex.present
          ? data.archetypeIndex.value
          : this.archetypeIndex,
      archetypeLabel: data.archetypeLabel.present
          ? data.archetypeLabel.value
          : this.archetypeLabel,
      paletteIndex: data.paletteIndex.present
          ? data.paletteIndex.value
          : this.paletteIndex,
      paletteColorValue: data.paletteColorValue.present
          ? data.paletteColorValue.value
          : this.paletteColorValue,
      selectedTraitIndexesJson: data.selectedTraitIndexesJson.present
          ? data.selectedTraitIndexesJson.value
          : this.selectedTraitIndexesJson,
      selectedTraitLabelsJson: data.selectedTraitLabelsJson.present
          ? data.selectedTraitLabelsJson.value
          : this.selectedTraitLabelsJson,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
      pendingSync: data.pendingSync.present
          ? data.pendingSync.value
          : this.pendingSync,
      lastSyncError: data.lastSyncError.present
          ? data.lastSyncError.value
          : this.lastSyncError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HeroineProfileRow(')
          ..write('id: $id, ')
          ..write('ownerUid: $ownerUid, ')
          ..write('name: $name, ')
          ..write('archetype: $archetype, ')
          ..write('subtitle: $subtitle, ')
          ..write('traitsJson: $traitsJson, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('profileText: $profileText, ')
          ..write('greeting: $greeting, ')
          ..write('storySeed: $storySeed, ')
          ..write('ageIndex: $ageIndex, ')
          ..write('ageLabel: $ageLabel, ')
          ..write('genderIndex: $genderIndex, ')
          ..write('genderLabel: $genderLabel, ')
          ..write('focusIndex: $focusIndex, ')
          ..write('focusLabel: $focusLabel, ')
          ..write('moodIndex: $moodIndex, ')
          ..write('moodLabel: $moodLabel, ')
          ..write('aestheticIndex: $aestheticIndex, ')
          ..write('aestheticLabel: $aestheticLabel, ')
          ..write('visualStyleIndex: $visualStyleIndex, ')
          ..write('visualStyleLabel: $visualStyleLabel, ')
          ..write('archetypeIndex: $archetypeIndex, ')
          ..write('archetypeLabel: $archetypeLabel, ')
          ..write('paletteIndex: $paletteIndex, ')
          ..write('paletteColorValue: $paletteColorValue, ')
          ..write('selectedTraitIndexesJson: $selectedTraitIndexesJson, ')
          ..write('selectedTraitLabelsJson: $selectedTraitLabelsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('lastSyncError: $lastSyncError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    ownerUid,
    name,
    archetype,
    subtitle,
    traitsJson,
    imageAsset,
    profileText,
    greeting,
    storySeed,
    ageIndex,
    ageLabel,
    genderIndex,
    genderLabel,
    focusIndex,
    focusLabel,
    moodIndex,
    moodLabel,
    aestheticIndex,
    aestheticLabel,
    visualStyleIndex,
    visualStyleLabel,
    archetypeIndex,
    archetypeLabel,
    paletteIndex,
    paletteColorValue,
    selectedTraitIndexesJson,
    selectedTraitLabelsJson,
    createdAt,
    updatedAt,
    syncedAt,
    pendingSync,
    lastSyncError,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HeroineProfileRow &&
          other.id == this.id &&
          other.ownerUid == this.ownerUid &&
          other.name == this.name &&
          other.archetype == this.archetype &&
          other.subtitle == this.subtitle &&
          other.traitsJson == this.traitsJson &&
          other.imageAsset == this.imageAsset &&
          other.profileText == this.profileText &&
          other.greeting == this.greeting &&
          other.storySeed == this.storySeed &&
          other.ageIndex == this.ageIndex &&
          other.ageLabel == this.ageLabel &&
          other.genderIndex == this.genderIndex &&
          other.genderLabel == this.genderLabel &&
          other.focusIndex == this.focusIndex &&
          other.focusLabel == this.focusLabel &&
          other.moodIndex == this.moodIndex &&
          other.moodLabel == this.moodLabel &&
          other.aestheticIndex == this.aestheticIndex &&
          other.aestheticLabel == this.aestheticLabel &&
          other.visualStyleIndex == this.visualStyleIndex &&
          other.visualStyleLabel == this.visualStyleLabel &&
          other.archetypeIndex == this.archetypeIndex &&
          other.archetypeLabel == this.archetypeLabel &&
          other.paletteIndex == this.paletteIndex &&
          other.paletteColorValue == this.paletteColorValue &&
          other.selectedTraitIndexesJson == this.selectedTraitIndexesJson &&
          other.selectedTraitLabelsJson == this.selectedTraitLabelsJson &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncedAt == this.syncedAt &&
          other.pendingSync == this.pendingSync &&
          other.lastSyncError == this.lastSyncError);
}

class HeroineProfileRowsCompanion extends UpdateCompanion<HeroineProfileRow> {
  final Value<String> id;
  final Value<String?> ownerUid;
  final Value<String> name;
  final Value<String> archetype;
  final Value<String> subtitle;
  final Value<String> traitsJson;
  final Value<String> imageAsset;
  final Value<String> profileText;
  final Value<String> greeting;
  final Value<String> storySeed;
  final Value<int> ageIndex;
  final Value<String> ageLabel;
  final Value<int> genderIndex;
  final Value<String> genderLabel;
  final Value<int> focusIndex;
  final Value<String> focusLabel;
  final Value<int> moodIndex;
  final Value<String> moodLabel;
  final Value<int> aestheticIndex;
  final Value<String> aestheticLabel;
  final Value<int> visualStyleIndex;
  final Value<String> visualStyleLabel;
  final Value<int> archetypeIndex;
  final Value<String> archetypeLabel;
  final Value<int> paletteIndex;
  final Value<int> paletteColorValue;
  final Value<String> selectedTraitIndexesJson;
  final Value<String> selectedTraitLabelsJson;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> syncedAt;
  final Value<bool> pendingSync;
  final Value<String?> lastSyncError;
  final Value<int> rowid;
  const HeroineProfileRowsCompanion({
    this.id = const Value.absent(),
    this.ownerUid = const Value.absent(),
    this.name = const Value.absent(),
    this.archetype = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.traitsJson = const Value.absent(),
    this.imageAsset = const Value.absent(),
    this.profileText = const Value.absent(),
    this.greeting = const Value.absent(),
    this.storySeed = const Value.absent(),
    this.ageIndex = const Value.absent(),
    this.ageLabel = const Value.absent(),
    this.genderIndex = const Value.absent(),
    this.genderLabel = const Value.absent(),
    this.focusIndex = const Value.absent(),
    this.focusLabel = const Value.absent(),
    this.moodIndex = const Value.absent(),
    this.moodLabel = const Value.absent(),
    this.aestheticIndex = const Value.absent(),
    this.aestheticLabel = const Value.absent(),
    this.visualStyleIndex = const Value.absent(),
    this.visualStyleLabel = const Value.absent(),
    this.archetypeIndex = const Value.absent(),
    this.archetypeLabel = const Value.absent(),
    this.paletteIndex = const Value.absent(),
    this.paletteColorValue = const Value.absent(),
    this.selectedTraitIndexesJson = const Value.absent(),
    this.selectedTraitLabelsJson = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HeroineProfileRowsCompanion.insert({
    required String id,
    this.ownerUid = const Value.absent(),
    required String name,
    required String archetype,
    required String subtitle,
    required String traitsJson,
    required String imageAsset,
    required String profileText,
    required String greeting,
    required String storySeed,
    required int ageIndex,
    required String ageLabel,
    required int genderIndex,
    required String genderLabel,
    required int focusIndex,
    required String focusLabel,
    required int moodIndex,
    required String moodLabel,
    required int aestheticIndex,
    required String aestheticLabel,
    required int visualStyleIndex,
    required String visualStyleLabel,
    required int archetypeIndex,
    required String archetypeLabel,
    required int paletteIndex,
    required int paletteColorValue,
    required String selectedTraitIndexesJson,
    required String selectedTraitLabelsJson,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncedAt = const Value.absent(),
    this.pendingSync = const Value.absent(),
    this.lastSyncError = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       archetype = Value(archetype),
       subtitle = Value(subtitle),
       traitsJson = Value(traitsJson),
       imageAsset = Value(imageAsset),
       profileText = Value(profileText),
       greeting = Value(greeting),
       storySeed = Value(storySeed),
       ageIndex = Value(ageIndex),
       ageLabel = Value(ageLabel),
       genderIndex = Value(genderIndex),
       genderLabel = Value(genderLabel),
       focusIndex = Value(focusIndex),
       focusLabel = Value(focusLabel),
       moodIndex = Value(moodIndex),
       moodLabel = Value(moodLabel),
       aestheticIndex = Value(aestheticIndex),
       aestheticLabel = Value(aestheticLabel),
       visualStyleIndex = Value(visualStyleIndex),
       visualStyleLabel = Value(visualStyleLabel),
       archetypeIndex = Value(archetypeIndex),
       archetypeLabel = Value(archetypeLabel),
       paletteIndex = Value(paletteIndex),
       paletteColorValue = Value(paletteColorValue),
       selectedTraitIndexesJson = Value(selectedTraitIndexesJson),
       selectedTraitLabelsJson = Value(selectedTraitLabelsJson),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<HeroineProfileRow> custom({
    Expression<String>? id,
    Expression<String>? ownerUid,
    Expression<String>? name,
    Expression<String>? archetype,
    Expression<String>? subtitle,
    Expression<String>? traitsJson,
    Expression<String>? imageAsset,
    Expression<String>? profileText,
    Expression<String>? greeting,
    Expression<String>? storySeed,
    Expression<int>? ageIndex,
    Expression<String>? ageLabel,
    Expression<int>? genderIndex,
    Expression<String>? genderLabel,
    Expression<int>? focusIndex,
    Expression<String>? focusLabel,
    Expression<int>? moodIndex,
    Expression<String>? moodLabel,
    Expression<int>? aestheticIndex,
    Expression<String>? aestheticLabel,
    Expression<int>? visualStyleIndex,
    Expression<String>? visualStyleLabel,
    Expression<int>? archetypeIndex,
    Expression<String>? archetypeLabel,
    Expression<int>? paletteIndex,
    Expression<int>? paletteColorValue,
    Expression<String>? selectedTraitIndexesJson,
    Expression<String>? selectedTraitLabelsJson,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? syncedAt,
    Expression<bool>? pendingSync,
    Expression<String>? lastSyncError,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerUid != null) 'owner_uid': ownerUid,
      if (name != null) 'name': name,
      if (archetype != null) 'archetype': archetype,
      if (subtitle != null) 'subtitle': subtitle,
      if (traitsJson != null) 'traits_json': traitsJson,
      if (imageAsset != null) 'image_asset': imageAsset,
      if (profileText != null) 'profile_text': profileText,
      if (greeting != null) 'greeting': greeting,
      if (storySeed != null) 'story_seed': storySeed,
      if (ageIndex != null) 'age_index': ageIndex,
      if (ageLabel != null) 'age_label': ageLabel,
      if (genderIndex != null) 'gender_index': genderIndex,
      if (genderLabel != null) 'gender_label': genderLabel,
      if (focusIndex != null) 'focus_index': focusIndex,
      if (focusLabel != null) 'focus_label': focusLabel,
      if (moodIndex != null) 'mood_index': moodIndex,
      if (moodLabel != null) 'mood_label': moodLabel,
      if (aestheticIndex != null) 'aesthetic_index': aestheticIndex,
      if (aestheticLabel != null) 'aesthetic_label': aestheticLabel,
      if (visualStyleIndex != null) 'visual_style_index': visualStyleIndex,
      if (visualStyleLabel != null) 'visual_style_label': visualStyleLabel,
      if (archetypeIndex != null) 'archetype_index': archetypeIndex,
      if (archetypeLabel != null) 'archetype_label': archetypeLabel,
      if (paletteIndex != null) 'palette_index': paletteIndex,
      if (paletteColorValue != null) 'palette_color_value': paletteColorValue,
      if (selectedTraitIndexesJson != null)
        'selected_trait_indexes_json': selectedTraitIndexesJson,
      if (selectedTraitLabelsJson != null)
        'selected_trait_labels_json': selectedTraitLabelsJson,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (pendingSync != null) 'pending_sync': pendingSync,
      if (lastSyncError != null) 'last_sync_error': lastSyncError,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HeroineProfileRowsCompanion copyWith({
    Value<String>? id,
    Value<String?>? ownerUid,
    Value<String>? name,
    Value<String>? archetype,
    Value<String>? subtitle,
    Value<String>? traitsJson,
    Value<String>? imageAsset,
    Value<String>? profileText,
    Value<String>? greeting,
    Value<String>? storySeed,
    Value<int>? ageIndex,
    Value<String>? ageLabel,
    Value<int>? genderIndex,
    Value<String>? genderLabel,
    Value<int>? focusIndex,
    Value<String>? focusLabel,
    Value<int>? moodIndex,
    Value<String>? moodLabel,
    Value<int>? aestheticIndex,
    Value<String>? aestheticLabel,
    Value<int>? visualStyleIndex,
    Value<String>? visualStyleLabel,
    Value<int>? archetypeIndex,
    Value<String>? archetypeLabel,
    Value<int>? paletteIndex,
    Value<int>? paletteColorValue,
    Value<String>? selectedTraitIndexesJson,
    Value<String>? selectedTraitLabelsJson,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? syncedAt,
    Value<bool>? pendingSync,
    Value<String?>? lastSyncError,
    Value<int>? rowid,
  }) {
    return HeroineProfileRowsCompanion(
      id: id ?? this.id,
      ownerUid: ownerUid ?? this.ownerUid,
      name: name ?? this.name,
      archetype: archetype ?? this.archetype,
      subtitle: subtitle ?? this.subtitle,
      traitsJson: traitsJson ?? this.traitsJson,
      imageAsset: imageAsset ?? this.imageAsset,
      profileText: profileText ?? this.profileText,
      greeting: greeting ?? this.greeting,
      storySeed: storySeed ?? this.storySeed,
      ageIndex: ageIndex ?? this.ageIndex,
      ageLabel: ageLabel ?? this.ageLabel,
      genderIndex: genderIndex ?? this.genderIndex,
      genderLabel: genderLabel ?? this.genderLabel,
      focusIndex: focusIndex ?? this.focusIndex,
      focusLabel: focusLabel ?? this.focusLabel,
      moodIndex: moodIndex ?? this.moodIndex,
      moodLabel: moodLabel ?? this.moodLabel,
      aestheticIndex: aestheticIndex ?? this.aestheticIndex,
      aestheticLabel: aestheticLabel ?? this.aestheticLabel,
      visualStyleIndex: visualStyleIndex ?? this.visualStyleIndex,
      visualStyleLabel: visualStyleLabel ?? this.visualStyleLabel,
      archetypeIndex: archetypeIndex ?? this.archetypeIndex,
      archetypeLabel: archetypeLabel ?? this.archetypeLabel,
      paletteIndex: paletteIndex ?? this.paletteIndex,
      paletteColorValue: paletteColorValue ?? this.paletteColorValue,
      selectedTraitIndexesJson:
          selectedTraitIndexesJson ?? this.selectedTraitIndexesJson,
      selectedTraitLabelsJson:
          selectedTraitLabelsJson ?? this.selectedTraitLabelsJson,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncedAt: syncedAt ?? this.syncedAt,
      pendingSync: pendingSync ?? this.pendingSync,
      lastSyncError: lastSyncError ?? this.lastSyncError,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerUid.present) {
      map['owner_uid'] = Variable<String>(ownerUid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (archetype.present) {
      map['archetype'] = Variable<String>(archetype.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (traitsJson.present) {
      map['traits_json'] = Variable<String>(traitsJson.value);
    }
    if (imageAsset.present) {
      map['image_asset'] = Variable<String>(imageAsset.value);
    }
    if (profileText.present) {
      map['profile_text'] = Variable<String>(profileText.value);
    }
    if (greeting.present) {
      map['greeting'] = Variable<String>(greeting.value);
    }
    if (storySeed.present) {
      map['story_seed'] = Variable<String>(storySeed.value);
    }
    if (ageIndex.present) {
      map['age_index'] = Variable<int>(ageIndex.value);
    }
    if (ageLabel.present) {
      map['age_label'] = Variable<String>(ageLabel.value);
    }
    if (genderIndex.present) {
      map['gender_index'] = Variable<int>(genderIndex.value);
    }
    if (genderLabel.present) {
      map['gender_label'] = Variable<String>(genderLabel.value);
    }
    if (focusIndex.present) {
      map['focus_index'] = Variable<int>(focusIndex.value);
    }
    if (focusLabel.present) {
      map['focus_label'] = Variable<String>(focusLabel.value);
    }
    if (moodIndex.present) {
      map['mood_index'] = Variable<int>(moodIndex.value);
    }
    if (moodLabel.present) {
      map['mood_label'] = Variable<String>(moodLabel.value);
    }
    if (aestheticIndex.present) {
      map['aesthetic_index'] = Variable<int>(aestheticIndex.value);
    }
    if (aestheticLabel.present) {
      map['aesthetic_label'] = Variable<String>(aestheticLabel.value);
    }
    if (visualStyleIndex.present) {
      map['visual_style_index'] = Variable<int>(visualStyleIndex.value);
    }
    if (visualStyleLabel.present) {
      map['visual_style_label'] = Variable<String>(visualStyleLabel.value);
    }
    if (archetypeIndex.present) {
      map['archetype_index'] = Variable<int>(archetypeIndex.value);
    }
    if (archetypeLabel.present) {
      map['archetype_label'] = Variable<String>(archetypeLabel.value);
    }
    if (paletteIndex.present) {
      map['palette_index'] = Variable<int>(paletteIndex.value);
    }
    if (paletteColorValue.present) {
      map['palette_color_value'] = Variable<int>(paletteColorValue.value);
    }
    if (selectedTraitIndexesJson.present) {
      map['selected_trait_indexes_json'] = Variable<String>(
        selectedTraitIndexesJson.value,
      );
    }
    if (selectedTraitLabelsJson.present) {
      map['selected_trait_labels_json'] = Variable<String>(
        selectedTraitLabelsJson.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    if (pendingSync.present) {
      map['pending_sync'] = Variable<bool>(pendingSync.value);
    }
    if (lastSyncError.present) {
      map['last_sync_error'] = Variable<String>(lastSyncError.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HeroineProfileRowsCompanion(')
          ..write('id: $id, ')
          ..write('ownerUid: $ownerUid, ')
          ..write('name: $name, ')
          ..write('archetype: $archetype, ')
          ..write('subtitle: $subtitle, ')
          ..write('traitsJson: $traitsJson, ')
          ..write('imageAsset: $imageAsset, ')
          ..write('profileText: $profileText, ')
          ..write('greeting: $greeting, ')
          ..write('storySeed: $storySeed, ')
          ..write('ageIndex: $ageIndex, ')
          ..write('ageLabel: $ageLabel, ')
          ..write('genderIndex: $genderIndex, ')
          ..write('genderLabel: $genderLabel, ')
          ..write('focusIndex: $focusIndex, ')
          ..write('focusLabel: $focusLabel, ')
          ..write('moodIndex: $moodIndex, ')
          ..write('moodLabel: $moodLabel, ')
          ..write('aestheticIndex: $aestheticIndex, ')
          ..write('aestheticLabel: $aestheticLabel, ')
          ..write('visualStyleIndex: $visualStyleIndex, ')
          ..write('visualStyleLabel: $visualStyleLabel, ')
          ..write('archetypeIndex: $archetypeIndex, ')
          ..write('archetypeLabel: $archetypeLabel, ')
          ..write('paletteIndex: $paletteIndex, ')
          ..write('paletteColorValue: $paletteColorValue, ')
          ..write('selectedTraitIndexesJson: $selectedTraitIndexesJson, ')
          ..write('selectedTraitLabelsJson: $selectedTraitLabelsJson, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('pendingSync: $pendingSync, ')
          ..write('lastSyncError: $lastSyncError, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$HeroineDatabase extends GeneratedDatabase {
  _$HeroineDatabase(QueryExecutor e) : super(e);
  $HeroineDatabaseManager get managers => $HeroineDatabaseManager(this);
  late final $HeroineProfileRowsTable heroineProfileRows =
      $HeroineProfileRowsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [heroineProfileRows];
}

typedef $$HeroineProfileRowsTableCreateCompanionBuilder =
    HeroineProfileRowsCompanion Function({
      required String id,
      Value<String?> ownerUid,
      required String name,
      required String archetype,
      required String subtitle,
      required String traitsJson,
      required String imageAsset,
      required String profileText,
      required String greeting,
      required String storySeed,
      required int ageIndex,
      required String ageLabel,
      required int genderIndex,
      required String genderLabel,
      required int focusIndex,
      required String focusLabel,
      required int moodIndex,
      required String moodLabel,
      required int aestheticIndex,
      required String aestheticLabel,
      required int visualStyleIndex,
      required String visualStyleLabel,
      required int archetypeIndex,
      required String archetypeLabel,
      required int paletteIndex,
      required int paletteColorValue,
      required String selectedTraitIndexesJson,
      required String selectedTraitLabelsJson,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> syncedAt,
      Value<bool> pendingSync,
      Value<String?> lastSyncError,
      Value<int> rowid,
    });
typedef $$HeroineProfileRowsTableUpdateCompanionBuilder =
    HeroineProfileRowsCompanion Function({
      Value<String> id,
      Value<String?> ownerUid,
      Value<String> name,
      Value<String> archetype,
      Value<String> subtitle,
      Value<String> traitsJson,
      Value<String> imageAsset,
      Value<String> profileText,
      Value<String> greeting,
      Value<String> storySeed,
      Value<int> ageIndex,
      Value<String> ageLabel,
      Value<int> genderIndex,
      Value<String> genderLabel,
      Value<int> focusIndex,
      Value<String> focusLabel,
      Value<int> moodIndex,
      Value<String> moodLabel,
      Value<int> aestheticIndex,
      Value<String> aestheticLabel,
      Value<int> visualStyleIndex,
      Value<String> visualStyleLabel,
      Value<int> archetypeIndex,
      Value<String> archetypeLabel,
      Value<int> paletteIndex,
      Value<int> paletteColorValue,
      Value<String> selectedTraitIndexesJson,
      Value<String> selectedTraitLabelsJson,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> syncedAt,
      Value<bool> pendingSync,
      Value<String?> lastSyncError,
      Value<int> rowid,
    });

class $$HeroineProfileRowsTableFilterComposer
    extends Composer<_$HeroineDatabase, $HeroineProfileRowsTable> {
  $$HeroineProfileRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerUid => $composableBuilder(
    column: $table.ownerUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archetype => $composableBuilder(
    column: $table.archetype,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get traitsJson => $composableBuilder(
    column: $table.traitsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get profileText => $composableBuilder(
    column: $table.profileText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get greeting => $composableBuilder(
    column: $table.greeting,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get storySeed => $composableBuilder(
    column: $table.storySeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ageIndex => $composableBuilder(
    column: $table.ageIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ageLabel => $composableBuilder(
    column: $table.ageLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get genderIndex => $composableBuilder(
    column: $table.genderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get genderLabel => $composableBuilder(
    column: $table.genderLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get focusIndex => $composableBuilder(
    column: $table.focusIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get focusLabel => $composableBuilder(
    column: $table.focusLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get moodIndex => $composableBuilder(
    column: $table.moodIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get moodLabel => $composableBuilder(
    column: $table.moodLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get aestheticIndex => $composableBuilder(
    column: $table.aestheticIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aestheticLabel => $composableBuilder(
    column: $table.aestheticLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get visualStyleIndex => $composableBuilder(
    column: $table.visualStyleIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get visualStyleLabel => $composableBuilder(
    column: $table.visualStyleLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get archetypeIndex => $composableBuilder(
    column: $table.archetypeIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get archetypeLabel => $composableBuilder(
    column: $table.archetypeLabel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paletteIndex => $composableBuilder(
    column: $table.paletteIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get paletteColorValue => $composableBuilder(
    column: $table.paletteColorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedTraitIndexesJson => $composableBuilder(
    column: $table.selectedTraitIndexesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedTraitLabelsJson => $composableBuilder(
    column: $table.selectedTraitLabelsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HeroineProfileRowsTableOrderingComposer
    extends Composer<_$HeroineDatabase, $HeroineProfileRowsTable> {
  $$HeroineProfileRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerUid => $composableBuilder(
    column: $table.ownerUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archetype => $composableBuilder(
    column: $table.archetype,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subtitle => $composableBuilder(
    column: $table.subtitle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get traitsJson => $composableBuilder(
    column: $table.traitsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get profileText => $composableBuilder(
    column: $table.profileText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get greeting => $composableBuilder(
    column: $table.greeting,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get storySeed => $composableBuilder(
    column: $table.storySeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ageIndex => $composableBuilder(
    column: $table.ageIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageLabel => $composableBuilder(
    column: $table.ageLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get genderIndex => $composableBuilder(
    column: $table.genderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get genderLabel => $composableBuilder(
    column: $table.genderLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get focusIndex => $composableBuilder(
    column: $table.focusIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get focusLabel => $composableBuilder(
    column: $table.focusLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get moodIndex => $composableBuilder(
    column: $table.moodIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get moodLabel => $composableBuilder(
    column: $table.moodLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get aestheticIndex => $composableBuilder(
    column: $table.aestheticIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aestheticLabel => $composableBuilder(
    column: $table.aestheticLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get visualStyleIndex => $composableBuilder(
    column: $table.visualStyleIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get visualStyleLabel => $composableBuilder(
    column: $table.visualStyleLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get archetypeIndex => $composableBuilder(
    column: $table.archetypeIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get archetypeLabel => $composableBuilder(
    column: $table.archetypeLabel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paletteIndex => $composableBuilder(
    column: $table.paletteIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get paletteColorValue => $composableBuilder(
    column: $table.paletteColorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedTraitIndexesJson => $composableBuilder(
    column: $table.selectedTraitIndexesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedTraitLabelsJson => $composableBuilder(
    column: $table.selectedTraitLabelsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HeroineProfileRowsTableAnnotationComposer
    extends Composer<_$HeroineDatabase, $HeroineProfileRowsTable> {
  $$HeroineProfileRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ownerUid =>
      $composableBuilder(column: $table.ownerUid, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get archetype =>
      $composableBuilder(column: $table.archetype, builder: (column) => column);

  GeneratedColumn<String> get subtitle =>
      $composableBuilder(column: $table.subtitle, builder: (column) => column);

  GeneratedColumn<String> get traitsJson => $composableBuilder(
    column: $table.traitsJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageAsset => $composableBuilder(
    column: $table.imageAsset,
    builder: (column) => column,
  );

  GeneratedColumn<String> get profileText => $composableBuilder(
    column: $table.profileText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get greeting =>
      $composableBuilder(column: $table.greeting, builder: (column) => column);

  GeneratedColumn<String> get storySeed =>
      $composableBuilder(column: $table.storySeed, builder: (column) => column);

  GeneratedColumn<int> get ageIndex =>
      $composableBuilder(column: $table.ageIndex, builder: (column) => column);

  GeneratedColumn<String> get ageLabel =>
      $composableBuilder(column: $table.ageLabel, builder: (column) => column);

  GeneratedColumn<int> get genderIndex => $composableBuilder(
    column: $table.genderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get genderLabel => $composableBuilder(
    column: $table.genderLabel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get focusIndex => $composableBuilder(
    column: $table.focusIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get focusLabel => $composableBuilder(
    column: $table.focusLabel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get moodIndex =>
      $composableBuilder(column: $table.moodIndex, builder: (column) => column);

  GeneratedColumn<String> get moodLabel =>
      $composableBuilder(column: $table.moodLabel, builder: (column) => column);

  GeneratedColumn<int> get aestheticIndex => $composableBuilder(
    column: $table.aestheticIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get aestheticLabel => $composableBuilder(
    column: $table.aestheticLabel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get visualStyleIndex => $composableBuilder(
    column: $table.visualStyleIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get visualStyleLabel => $composableBuilder(
    column: $table.visualStyleLabel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get archetypeIndex => $composableBuilder(
    column: $table.archetypeIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get archetypeLabel => $composableBuilder(
    column: $table.archetypeLabel,
    builder: (column) => column,
  );

  GeneratedColumn<int> get paletteIndex => $composableBuilder(
    column: $table.paletteIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get paletteColorValue => $composableBuilder(
    column: $table.paletteColorValue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedTraitIndexesJson => $composableBuilder(
    column: $table.selectedTraitIndexesJson,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedTraitLabelsJson => $composableBuilder(
    column: $table.selectedTraitLabelsJson,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);

  GeneratedColumn<bool> get pendingSync => $composableBuilder(
    column: $table.pendingSync,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lastSyncError => $composableBuilder(
    column: $table.lastSyncError,
    builder: (column) => column,
  );
}

class $$HeroineProfileRowsTableTableManager
    extends
        RootTableManager<
          _$HeroineDatabase,
          $HeroineProfileRowsTable,
          HeroineProfileRow,
          $$HeroineProfileRowsTableFilterComposer,
          $$HeroineProfileRowsTableOrderingComposer,
          $$HeroineProfileRowsTableAnnotationComposer,
          $$HeroineProfileRowsTableCreateCompanionBuilder,
          $$HeroineProfileRowsTableUpdateCompanionBuilder,
          (
            HeroineProfileRow,
            BaseReferences<
              _$HeroineDatabase,
              $HeroineProfileRowsTable,
              HeroineProfileRow
            >,
          ),
          HeroineProfileRow,
          PrefetchHooks Function()
        > {
  $$HeroineProfileRowsTableTableManager(
    _$HeroineDatabase db,
    $HeroineProfileRowsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HeroineProfileRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HeroineProfileRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HeroineProfileRowsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> ownerUid = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> archetype = const Value.absent(),
                Value<String> subtitle = const Value.absent(),
                Value<String> traitsJson = const Value.absent(),
                Value<String> imageAsset = const Value.absent(),
                Value<String> profileText = const Value.absent(),
                Value<String> greeting = const Value.absent(),
                Value<String> storySeed = const Value.absent(),
                Value<int> ageIndex = const Value.absent(),
                Value<String> ageLabel = const Value.absent(),
                Value<int> genderIndex = const Value.absent(),
                Value<String> genderLabel = const Value.absent(),
                Value<int> focusIndex = const Value.absent(),
                Value<String> focusLabel = const Value.absent(),
                Value<int> moodIndex = const Value.absent(),
                Value<String> moodLabel = const Value.absent(),
                Value<int> aestheticIndex = const Value.absent(),
                Value<String> aestheticLabel = const Value.absent(),
                Value<int> visualStyleIndex = const Value.absent(),
                Value<String> visualStyleLabel = const Value.absent(),
                Value<int> archetypeIndex = const Value.absent(),
                Value<String> archetypeLabel = const Value.absent(),
                Value<int> paletteIndex = const Value.absent(),
                Value<int> paletteColorValue = const Value.absent(),
                Value<String> selectedTraitIndexesJson = const Value.absent(),
                Value<String> selectedTraitLabelsJson = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> syncedAt = const Value.absent(),
                Value<bool> pendingSync = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HeroineProfileRowsCompanion(
                id: id,
                ownerUid: ownerUid,
                name: name,
                archetype: archetype,
                subtitle: subtitle,
                traitsJson: traitsJson,
                imageAsset: imageAsset,
                profileText: profileText,
                greeting: greeting,
                storySeed: storySeed,
                ageIndex: ageIndex,
                ageLabel: ageLabel,
                genderIndex: genderIndex,
                genderLabel: genderLabel,
                focusIndex: focusIndex,
                focusLabel: focusLabel,
                moodIndex: moodIndex,
                moodLabel: moodLabel,
                aestheticIndex: aestheticIndex,
                aestheticLabel: aestheticLabel,
                visualStyleIndex: visualStyleIndex,
                visualStyleLabel: visualStyleLabel,
                archetypeIndex: archetypeIndex,
                archetypeLabel: archetypeLabel,
                paletteIndex: paletteIndex,
                paletteColorValue: paletteColorValue,
                selectedTraitIndexesJson: selectedTraitIndexesJson,
                selectedTraitLabelsJson: selectedTraitLabelsJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncedAt: syncedAt,
                pendingSync: pendingSync,
                lastSyncError: lastSyncError,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> ownerUid = const Value.absent(),
                required String name,
                required String archetype,
                required String subtitle,
                required String traitsJson,
                required String imageAsset,
                required String profileText,
                required String greeting,
                required String storySeed,
                required int ageIndex,
                required String ageLabel,
                required int genderIndex,
                required String genderLabel,
                required int focusIndex,
                required String focusLabel,
                required int moodIndex,
                required String moodLabel,
                required int aestheticIndex,
                required String aestheticLabel,
                required int visualStyleIndex,
                required String visualStyleLabel,
                required int archetypeIndex,
                required String archetypeLabel,
                required int paletteIndex,
                required int paletteColorValue,
                required String selectedTraitIndexesJson,
                required String selectedTraitLabelsJson,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> syncedAt = const Value.absent(),
                Value<bool> pendingSync = const Value.absent(),
                Value<String?> lastSyncError = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HeroineProfileRowsCompanion.insert(
                id: id,
                ownerUid: ownerUid,
                name: name,
                archetype: archetype,
                subtitle: subtitle,
                traitsJson: traitsJson,
                imageAsset: imageAsset,
                profileText: profileText,
                greeting: greeting,
                storySeed: storySeed,
                ageIndex: ageIndex,
                ageLabel: ageLabel,
                genderIndex: genderIndex,
                genderLabel: genderLabel,
                focusIndex: focusIndex,
                focusLabel: focusLabel,
                moodIndex: moodIndex,
                moodLabel: moodLabel,
                aestheticIndex: aestheticIndex,
                aestheticLabel: aestheticLabel,
                visualStyleIndex: visualStyleIndex,
                visualStyleLabel: visualStyleLabel,
                archetypeIndex: archetypeIndex,
                archetypeLabel: archetypeLabel,
                paletteIndex: paletteIndex,
                paletteColorValue: paletteColorValue,
                selectedTraitIndexesJson: selectedTraitIndexesJson,
                selectedTraitLabelsJson: selectedTraitLabelsJson,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncedAt: syncedAt,
                pendingSync: pendingSync,
                lastSyncError: lastSyncError,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HeroineProfileRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$HeroineDatabase,
      $HeroineProfileRowsTable,
      HeroineProfileRow,
      $$HeroineProfileRowsTableFilterComposer,
      $$HeroineProfileRowsTableOrderingComposer,
      $$HeroineProfileRowsTableAnnotationComposer,
      $$HeroineProfileRowsTableCreateCompanionBuilder,
      $$HeroineProfileRowsTableUpdateCompanionBuilder,
      (
        HeroineProfileRow,
        BaseReferences<
          _$HeroineDatabase,
          $HeroineProfileRowsTable,
          HeroineProfileRow
        >,
      ),
      HeroineProfileRow,
      PrefetchHooks Function()
    >;

class $HeroineDatabaseManager {
  final _$HeroineDatabase _db;
  $HeroineDatabaseManager(this._db);
  $$HeroineProfileRowsTableTableManager get heroineProfileRows =>
      $$HeroineProfileRowsTableTableManager(_db, _db.heroineProfileRows);
}
