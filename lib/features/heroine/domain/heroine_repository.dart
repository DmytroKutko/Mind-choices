import 'heroine_models.dart';

abstract interface class HeroineRepository {
  Stream<List<SavedHeroine>> watchSavedHeroines();

  Future<List<SavedHeroine>> loadSavedHeroines();

  Future<SavedHeroine> saveGeneratedHeroine({
    required HeroineProfile profile,
    required HeroineSelections selections,
  });

  Future<void> refreshFromRemote();

  Future<void> deleteHeroine(String id);
}
