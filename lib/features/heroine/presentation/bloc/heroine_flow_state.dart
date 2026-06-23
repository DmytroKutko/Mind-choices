import 'package:equatable/equatable.dart';

import '../../domain/heroine_models.dart';

enum HeroineGenerationStatus { idle, loading, success, failure }

final class HeroineFlowState extends Equatable {
  const HeroineFlowState({
    this.heroineName = 'Elara',
    this.ageIndex = 1,
    this.genderIndex = 0,
    this.focusIndex = 0,
    this.moodIndex = 1,
    this.aestheticIndex = 0,
    this.visualStyleIndex = 1,
    this.archetypeIndex = 1,
    this.paletteIndex = 2,
    this.selectedTraits = const [1, 3],
    this.savedHeroines = const [],
    this.selectedSavedHeroineId,
    this.generationStatus = HeroineGenerationStatus.idle,
    this.generatedProfile,
    this.generationError,
  });

  final String heroineName;
  final int ageIndex;
  final int genderIndex;
  final int focusIndex;
  final int moodIndex;
  final int aestheticIndex;
  final int visualStyleIndex;
  final int archetypeIndex;
  final int paletteIndex;
  final List<int> selectedTraits;
  final List<SavedHeroine> savedHeroines;
  final String? selectedSavedHeroineId;
  final HeroineGenerationStatus generationStatus;
  final HeroineProfile? generatedProfile;
  final String? generationError;

  static const minHeroineNameLength = 2;

  bool get hasSavedHeroine => savedHeroines.isNotEmpty;

  SavedHeroine? get selectedSavedHeroine {
    for (final heroine in savedHeroines) {
      if (heroine.id == selectedSavedHeroineId) {
        return heroine;
      }
    }

    return savedHeroines.isEmpty ? null : savedHeroines.first;
  }

  String get trimmedHeroineName => heroineName.trim();

  bool get hasValidHeroineName =>
      trimmedHeroineName.length >= minHeroineNameLength;

  HeroineFlowState copyWith({
    String? heroineName,
    int? ageIndex,
    int? genderIndex,
    int? focusIndex,
    int? moodIndex,
    int? aestheticIndex,
    int? visualStyleIndex,
    int? archetypeIndex,
    int? paletteIndex,
    List<int>? selectedTraits,
    List<SavedHeroine>? savedHeroines,
    String? selectedSavedHeroineId,
    bool clearSelectedSavedHeroine = false,
    HeroineGenerationStatus? generationStatus,
    HeroineProfile? generatedProfile,
    bool clearGeneratedProfile = false,
    String? generationError,
    bool clearGenerationError = false,
  }) {
    return HeroineFlowState(
      heroineName: heroineName ?? this.heroineName,
      ageIndex: ageIndex ?? this.ageIndex,
      genderIndex: genderIndex ?? this.genderIndex,
      focusIndex: focusIndex ?? this.focusIndex,
      moodIndex: moodIndex ?? this.moodIndex,
      aestheticIndex: aestheticIndex ?? this.aestheticIndex,
      visualStyleIndex: visualStyleIndex ?? this.visualStyleIndex,
      archetypeIndex: archetypeIndex ?? this.archetypeIndex,
      paletteIndex: paletteIndex ?? this.paletteIndex,
      selectedTraits: selectedTraits ?? this.selectedTraits,
      savedHeroines: savedHeroines ?? this.savedHeroines,
      selectedSavedHeroineId: clearSelectedSavedHeroine
          ? null
          : selectedSavedHeroineId ?? this.selectedSavedHeroineId,
      generationStatus: generationStatus ?? this.generationStatus,
      generatedProfile: clearGeneratedProfile
          ? null
          : generatedProfile ?? this.generatedProfile,
      generationError: clearGenerationError
          ? null
          : generationError ?? this.generationError,
    );
  }

  @override
  List<Object?> get props => [
    heroineName,
    ageIndex,
    genderIndex,
    focusIndex,
    moodIndex,
    aestheticIndex,
    visualStyleIndex,
    archetypeIndex,
    paletteIndex,
    selectedTraits,
    savedHeroines,
    selectedSavedHeroineId,
    generationStatus,
    generatedProfile,
    generationError,
  ];
}
