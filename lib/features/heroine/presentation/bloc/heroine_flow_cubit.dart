import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/mock_heroine_data.dart';
import '../../domain/heroine_models.dart';
import '../../domain/heroine_repository.dart';
import '../../domain/heroine_story_generator.dart';
import 'heroine_flow_state.dart';

final class HeroineFlowCubit extends Cubit<HeroineFlowState> {
  HeroineFlowCubit({
    required HeroineRepository repository,
    required HeroineStoryGenerator storyGenerator,
  }) : this._(repository, storyGenerator);

  HeroineFlowCubit._(this._repository, this._storyGenerator)
    : super(const HeroineFlowState()) {
    _savedHeroinesSubscription = _repository.watchSavedHeroines().listen((
      heroines,
    ) {
      final selectedId = state.selectedSavedHeroineId;
      final nextSelectedId =
          selectedId != null &&
              heroines.any((heroine) => heroine.id == selectedId)
          ? selectedId
          : null;

      emit(
        state.copyWith(
          savedHeroines: heroines,
          selectedSavedHeroineId: nextSelectedId,
          clearSelectedSavedHeroine: nextSelectedId == null,
        ),
      );
    });

    unawaited(_repository.refreshFromRemote());
  }

  final HeroineRepository _repository;
  final HeroineStoryGenerator _storyGenerator;
  StreamSubscription<List<SavedHeroine>>? _savedHeroinesSubscription;

  void changeHeroineName(String name) {
    emit(state.copyWith(heroineName: name));
  }

  void selectAge(int index) => emit(state.copyWith(ageIndex: index));

  void selectGender(int index) => emit(state.copyWith(genderIndex: index));

  void selectFocus(int index) => emit(state.copyWith(focusIndex: index));

  void selectMood(int index) => emit(state.copyWith(moodIndex: index));

  void selectAesthetic(int index) {
    emit(state.copyWith(aestheticIndex: index));
  }

  void selectVisualStyle(int index) {
    emit(state.copyWith(visualStyleIndex: index));
  }

  void selectArchetype(int index) {
    emit(state.copyWith(archetypeIndex: index));
  }

  void selectPalette(int index) => emit(state.copyWith(paletteIndex: index));

  void toggleTrait(int index) {
    final selected = [...state.selectedTraits];
    if (selected.contains(index)) {
      selected.remove(index);
    } else if (selected.length < 3) {
      selected.add(index);
    }
    emit(state.copyWith(selectedTraits: selected));
  }

  void selectSavedHeroine(String id) {
    emit(state.copyWith(selectedSavedHeroineId: id));
  }

  Future<void> generateProfile() async {
    if (state.generationStatus == HeroineGenerationStatus.loading) {
      return;
    }

    emit(
      state.copyWith(
        generationStatus: HeroineGenerationStatus.loading,
        clearGenerationError: true,
        clearGeneratedProfile: true,
      ),
    );

    try {
      final profile = await _storyGenerator.generateProfile(
        heroineName: state.trimmedHeroineName,
        selections: _currentSelections(),
      );
      emit(
        state.copyWith(
          generatedProfile: profile,
          generationStatus: HeroineGenerationStatus.success,
        ),
      );
    } on Object catch (error) {
      emit(
        state.copyWith(
          generationStatus: HeroineGenerationStatus.failure,
          generationError: _generationErrorMessage(error),
        ),
      );
    }
  }

  Future<void> markSaved(HeroineProfile profile) async {
    final saved = await _repository.saveGeneratedHeroine(
      profile: profile,
      selections: _currentSelections(),
    );
    emit(state.copyWith(selectedSavedHeroineId: saved.id));
  }

  Future<void> deleteSavedHeroine(String id) async {
    await _repository.deleteHeroine(id);
    emit(state.copyWith(clearSelectedSavedHeroine: true));
  }

  HeroineSelections _currentSelections() {
    return HeroineSelections(
      ageIndex: state.ageIndex,
      ageLabel: MockHeroineData.ageRanges[state.ageIndex],
      genderIndex: state.genderIndex,
      genderLabel: MockHeroineData.genders[state.genderIndex],
      focusIndex: state.focusIndex,
      focusLabel: MockHeroineData.focusOptions[state.focusIndex].label,
      moodIndex: state.moodIndex,
      moodLabel: MockHeroineData.moods[state.moodIndex],
      aestheticIndex: state.aestheticIndex,
      aestheticLabel:
          MockHeroineData.aestheticOptions[state.aestheticIndex].label,
      visualStyleIndex: state.visualStyleIndex,
      visualStyleLabel: MockHeroineData.visualStyles[state.visualStyleIndex],
      archetypeIndex: state.archetypeIndex,
      archetypeLabel: MockHeroineData.archetypes[state.archetypeIndex].title,
      paletteIndex: state.paletteIndex,
      paletteColorValue: MockHeroineData.palettes[state.paletteIndex]
          .toARGB32(),
      selectedTraitIndexes: state.selectedTraits,
      selectedTraitLabels: [
        for (final index in state.selectedTraits) MockHeroineData.traits[index],
      ],
    );
  }

  String _generationErrorMessage(Object error) {
    if (error is HeroineStoryGenerationException) {
      return error.message;
    }

    final text = error.toString();
    if (text.trim().isEmpty) {
      return 'Could not generate the heroine profile.';
    }

    return 'Could not generate the heroine profile. Check your connection and try again.';
  }

  @override
  Future<void> close() async {
    await _savedHeroinesSubscription?.cancel();
    return super.close();
  }
}
