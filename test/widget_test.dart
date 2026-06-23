import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mindchoices_heroine_studio/app/heroine_studio_app.dart';
import 'package:mindchoices_heroine_studio/app/routing/app_router.dart';
import 'package:mindchoices_heroine_studio/core/di/app_dependencies.dart';
import 'package:mindchoices_heroine_studio/features/heroine/data/mock_heroine_data.dart';
import 'package:mindchoices_heroine_studio/features/heroine/domain/heroine_models.dart';
import 'package:mindchoices_heroine_studio/features/heroine/domain/heroine_repository.dart';
import 'package:mindchoices_heroine_studio/features/heroine/domain/heroine_story_generator.dart';

void main() {
  late FakeHeroineRepository repository;
  late FakeHeroineStoryGenerator storyGenerator;

  setUp(() async {
    await serviceLocator.reset();
    repository = FakeHeroineRepository();
    storyGenerator = FakeHeroineStoryGenerator();
    serviceLocator.registerSingleton<HeroineRepository>(repository);
    serviceLocator.registerSingleton<HeroineStoryGenerator>(storyGenerator);
  });

  tearDown(() async {
    await serviceLocator.reset();
    await repository.close();
  });

  testWidgets('renders app bootstrap screen', (WidgetTester tester) async {
    await _pumpApp(tester);

    expect(find.text('MindChoices'), findsOneWidget);
    expect(find.text('Start'), findsOneWidget);
    expect(find.text('Continue saved heroine'), findsNothing);
  });

  testWidgets('opens personalize step from start screen', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();

    expect(find.text('Personalize'), findsOneWidget);
    expect(find.text('Step 1 of 3'), findsOneWidget);
    expect(find.text('Tell us about yourself'), findsOneWidget);
    expect(find.text('Current Focus'), findsOneWidget);
    expect(find.text('Aesthetic Resonance'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('opens customization step from personalize step', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Heroine Studio'), findsOneWidget);
    expect(find.text('Step 2 of 3'), findsOneWidget);
    expect(find.text('HEROINE NAME'), findsOneWidget);
    expect(find.text('Elara'), findsWidgets);
    expect(find.text('The Modern Mystic'), findsOneWidget);
    expect(find.text('VISUAL STYLE'), findsOneWidget);
    expect(find.text('Generate profile'), findsOneWidget);

    await tester.enterText(find.byType(EditableText), 'Mira');
    await tester.pumpAndSettle();

    expect(find.text('Mira'), findsWidgets);
  });

  testWidgets('requires at least two heroine name characters', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(EditableText), '');
    await tester.pumpAndSettle();

    expect(find.text('Unknown'), findsOneWidget);
    expect(find.text('Name must be at least 2 characters.'), findsOneWidget);

    await tester.tap(find.text('Generate profile'));
    await tester.pumpAndSettle();

    expect(find.text('Writing her first words...'), findsNothing);
  });

  testWidgets('generates profile before opening result screen', (
    WidgetTester tester,
  ) async {
    await _pumpApp(tester);

    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Generate profile'));
    await tester.pumpAndSettle();

    expect(storyGenerator.generatedCount, 1);
    expect(find.text('Profile Ready'), findsOneWidget);
    expect(find.text('Generated profile for Confidence.'), findsOneWidget);
  });

  testWidgets('shows exact AI generation failure message', (
    WidgetTester tester,
  ) async {
    storyGenerator.errorToThrow = const HeroineStoryGenerationException(
      'AI response was incomplete. Try again.',
    );

    await _pumpApp(tester);

    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Generate profile'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump();

    expect(find.text('Writing her first words...'), findsOneWidget);
    expect(find.text('AI response was incomplete. Try again.'), findsOneWidget);
    expect(find.text('Try again'), findsOneWidget);
  });

  testWidgets('renders generated heroine result screen', (
    WidgetTester tester,
  ) async {
    appRouter.go(AppRoutes.result);
    await tester.pumpWidget(const HeroineStudioApp());
    await tester.pumpAndSettle();

    expect(find.text('Step 3 of 3'), findsOneWidget);
    expect(find.text('Profile Ready'), findsOneWidget);
    expect(find.text('Elara'), findsOneWidget);
    expect(find.text('Her Profile'), findsOneWidget);
    expect(find.text('Story Seed'), findsOneWidget);
    expect(find.text('Save heroine'), findsOneWidget);
    expect(find.text('Regenerate'), findsOneWidget);
    expect(find.text('Edit choices'), findsOneWidget);
  });

  testWidgets('saves generated heroine before opening confirmation', (
    WidgetTester tester,
  ) async {
    appRouter.go(AppRoutes.result);
    await tester.pumpWidget(const HeroineStudioApp());
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Save heroine'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save heroine'));
    await tester.pumpAndSettle();

    expect(repository.savedCount, 1);
    expect(find.text('Heroine saved'), findsOneWidget);
  });

  testWidgets('edit choices returns to first creation step', (
    WidgetTester tester,
  ) async {
    appRouter.go(AppRoutes.result);
    await tester.pumpWidget(const HeroineStudioApp());
    await tester.pumpAndSettle();

    await tester.ensureVisible(find.text('Edit choices'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Edit choices'));
    await tester.pumpAndSettle();

    expect(find.text('Personalize'), findsOneWidget);
    expect(find.text('Step 1 of 3'), findsOneWidget);
  });

  testWidgets('renders saved heroine detail screen', (
    WidgetTester tester,
  ) async {
    appRouter.go(AppRoutes.detail);
    await tester.pumpWidget(const HeroineStudioApp());
    await tester.pumpAndSettle();

    expect(find.text('Elenora Vance'), findsWidgets);
    expect(find.byIcon(Icons.cloud_done_outlined), findsOneWidget);
    expect(find.text('The Architect of Shadows'), findsOneWidget);
    expect(find.text('Your Choices'), findsOneWidget);
    expect(find.text('Character Profile'), findsOneWidget);
    expect(find.text('Greeting'), findsOneWidget);
    expect(find.text('Edit Profile'), findsOneWidget);
    expect(find.text('Regenerate Greeting'), findsOneWidget);
    expect(find.text('Delete Heroine'), findsOneWidget);
  });
}

Future<void> _pumpApp(WidgetTester tester) async {
  appRouter.go(AppRoutes.start);
  await tester.pumpWidget(const HeroineStudioApp());
  await tester.pumpAndSettle();
}

final class FakeHeroineStoryGenerator implements HeroineStoryGenerator {
  var generatedCount = 0;
  Object? errorToThrow;

  @override
  Future<HeroineProfile> generateProfile({
    required String heroineName,
    required HeroineSelections selections,
  }) async {
    generatedCount += 1;

    final error = errorToThrow;
    if (error != null) {
      throw error;
    }

    return HeroineProfile(
      name: heroineName,
      archetype: selections.archetypeLabel,
      subtitle: 'AI Generated Profile',
      traits: selections.selectedTraitLabels,
      imageAsset: MockHeroineAssets.heroineResult,
      profile: 'Generated profile for ${selections.focusLabel}.',
      greeting: 'I am ready to begin.',
      storySeed: 'A quiet sign appears and asks her to choose a path.',
    );
  }
}

final class FakeHeroineRepository implements HeroineRepository {
  final _saved = <SavedHeroine>[];
  final _controller = StreamController<List<SavedHeroine>>.broadcast();

  int get savedCount => _saved.length;

  @override
  Stream<List<SavedHeroine>> watchSavedHeroines() async* {
    yield List.unmodifiable(_saved);
    yield* _controller.stream;
  }

  @override
  Future<List<SavedHeroine>> loadSavedHeroines() async {
    return List.unmodifiable(_saved);
  }

  @override
  Future<SavedHeroine> saveGeneratedHeroine({
    required HeroineProfile profile,
    required HeroineSelections selections,
  }) async {
    final now = DateTime.now().toUtc();
    final saved = SavedHeroine(
      id: 'test_${now.microsecondsSinceEpoch}',
      profile: profile,
      selections: selections,
      createdAt: now,
      updatedAt: now,
      syncedAt: now,
      pendingSync: false,
    );
    _saved.insert(0, saved);
    _controller.add(List.unmodifiable(_saved));

    return saved;
  }

  @override
  Future<void> refreshFromRemote() async {}

  @override
  Future<void> deleteHeroine(String id) async {
    _saved.removeWhere((heroine) => heroine.id == id);
    _controller.add(List.unmodifiable(_saved));
  }

  Future<void> close() => _controller.close();
}
