import 'heroine_models.dart';

abstract interface class HeroineStoryGenerator {
  Future<HeroineProfile> generateProfile({
    required String heroineName,
    required HeroineSelections selections,
  });
}

final class HeroineStoryGenerationException implements Exception {
  const HeroineStoryGenerationException(this.message);

  final String message;

  @override
  String toString() => message;
}
