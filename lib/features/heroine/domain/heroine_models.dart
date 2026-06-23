import 'package:flutter/material.dart';

final class AestheticOption {
  const AestheticOption({
    required this.label,
    this.assetPath,
    this.backgroundColor,
  });

  final String label;
  final String? assetPath;
  final Color? backgroundColor;
}

final class FocusOption {
  const FocusOption({required this.label, required this.icon});

  final String label;
  final IconData icon;
}

final class ArchetypeOption {
  const ArchetypeOption({required this.title, required this.description});

  final String title;
  final String description;
}

final class HeroineProfile {
  const HeroineProfile({
    required this.name,
    required this.archetype,
    required this.subtitle,
    required this.traits,
    required this.profile,
    required this.greeting,
    required this.storySeed,
    required this.imageAsset,
  });

  final String name;
  final String archetype;
  final String subtitle;
  final List<String> traits;
  final String profile;
  final String greeting;
  final String storySeed;
  final String imageAsset;
}

final class HeroineSelections {
  const HeroineSelections({
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
    required this.selectedTraitIndexes,
    required this.selectedTraitLabels,
  });

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
  final List<int> selectedTraitIndexes;
  final List<String> selectedTraitLabels;
}

final class SavedHeroine {
  const SavedHeroine({
    required this.id,
    required this.profile,
    required this.selections,
    required this.createdAt,
    required this.updatedAt,
    this.ownerUid,
    this.syncedAt,
    this.pendingSync = true,
    this.lastSyncError,
  });

  final String id;
  final String? ownerUid;
  final HeroineProfile profile;
  final HeroineSelections selections;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? syncedAt;
  final bool pendingSync;
  final String? lastSyncError;

  SavedHeroine copyWith({
    String? ownerUid,
    HeroineProfile? profile,
    HeroineSelections? selections,
    DateTime? updatedAt,
    DateTime? syncedAt,
    bool? pendingSync,
    String? lastSyncError,
  }) {
    return SavedHeroine(
      id: id,
      ownerUid: ownerUid ?? this.ownerUid,
      profile: profile ?? this.profile,
      selections: selections ?? this.selections,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncedAt: syncedAt ?? this.syncedAt,
      pendingSync: pendingSync ?? this.pendingSync,
      lastSyncError: lastSyncError,
    );
  }
}
