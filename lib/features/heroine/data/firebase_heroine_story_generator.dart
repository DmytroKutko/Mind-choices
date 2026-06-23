import 'dart:convert';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/heroine_models.dart';
import '../domain/heroine_story_generator.dart';
import 'mock_heroine_data.dart';

final class FirebaseHeroineStoryGenerator implements HeroineStoryGenerator {
  FirebaseHeroineStoryGenerator({
    required GenerativeModel model,
    required FirebaseAuth firebaseAuth,
  }) : this._(model, firebaseAuth);

  FirebaseHeroineStoryGenerator._(this._model, this._firebaseAuth);

  static final Schema _responseSchema = Schema.object(
    properties: {
      'name': Schema.string(
        description: 'The final heroine name. Usually the provided name.',
      ),
      'archetype': Schema.string(
        description: 'The selected archetype title, unchanged.',
      ),
      'subtitle': Schema.string(
        description: 'A short title for the heroine, 3 to 5 words.',
      ),
      'traits': Schema.array(items: Schema.string(), minItems: 2, maxItems: 3),
      'profile': Schema.string(
        description:
            'A polished character profile paragraph for the result screen.',
      ),
      'greeting': Schema.string(
        description: 'A first-person greeting quote from the heroine.',
      ),
      'storySeed': Schema.string(
        description: 'A short narrative hook for the heroine story.',
      ),
    },
    propertyOrdering: [
      'name',
      'archetype',
      'subtitle',
      'traits',
      'profile',
      'greeting',
      'storySeed',
    ],
  );

  final GenerativeModel _model;
  final FirebaseAuth _firebaseAuth;

  @override
  Future<HeroineProfile> generateProfile({
    required String heroineName,
    required HeroineSelections selections,
  }) async {
    final fallbackName = _fallbackName(heroineName);
    final response = await _generateProfileResponse(fallbackName, selections);

    final candidate = response.candidates.isEmpty
        ? null
        : response.candidates.first;
    if (candidate?.finishReason == FinishReason.maxTokens) {
      throw const HeroineStoryGenerationException(
        'AI response was incomplete. Try again.',
      );
    }

    final rawText = _responseText(response);
    if (rawText == null || rawText.trim().isEmpty) {
      throw const HeroineStoryGenerationException(
        'AI returned an empty profile. Try again.',
      );
    }

    final Object? decoded;
    try {
      decoded = jsonDecode(rawText);
    } on FormatException {
      throw const HeroineStoryGenerationException(
        'AI returned an incomplete profile. Try again.',
      );
    }

    if (decoded is! Map<String, dynamic>) {
      throw const HeroineStoryGenerationException(
        'AI returned an invalid profile. Try again.',
      );
    }

    return _profileFromJson(
      decoded,
      fallbackName: fallbackName,
      selections: selections,
    );
  }

  Future<GenerateContentResponse> _generateProfileResponse(
    String heroineName,
    HeroineSelections selections,
  ) async {
    await _ensureAnonymousUser();

    try {
      return await _model.generateContent(
        [Content.text(_buildPrompt(heroineName, selections))],
        generationConfig: GenerationConfig(
          responseMimeType: 'application/json',
          responseSchema: _responseSchema,
          temperature: 0.75,
          maxOutputTokens: 2400,
        ),
      );
    } on FirebaseAIException catch (error) {
      throw HeroineStoryGenerationException(_firebaseAiErrorMessage(error));
    } on Object catch (error) {
      throw HeroineStoryGenerationException(
        _unexpectedFirebaseErrorMessage(error),
      );
    }
  }

  Future<void> _ensureAnonymousUser() async {
    if (_firebaseAuth.currentUser != null) {
      return;
    }

    try {
      await _firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (error) {
      throw HeroineStoryGenerationException(_firebaseAuthErrorMessage(error));
    } on Object {
      throw const HeroineStoryGenerationException(
        'Could not sign in anonymously. Check Firebase Auth and try again.',
      );
    }
  }

  String? _responseText(GenerateContentResponse response) {
    try {
      return response.text;
    } on FirebaseAIException catch (error) {
      throw HeroineStoryGenerationException(_firebaseAiErrorMessage(error));
    } on Object catch (error) {
      throw HeroineStoryGenerationException(
        _unexpectedFirebaseErrorMessage(error),
      );
    }
  }

  String _firebaseAiErrorMessage(FirebaseAIException error) {
    final message = error.message.trim();
    if (message.isEmpty) {
      return 'Firebase AI rejected the request. Check Firebase AI Logic setup.';
    }

    return 'Firebase AI rejected the request: $message';
  }

  String _unexpectedFirebaseErrorMessage(Object error) {
    final text = error.toString().trim();
    if (text.isEmpty) {
      return 'Firebase AI request failed. Check Firebase App Check and Auth setup.';
    }

    return 'Firebase AI request failed: $text';
  }

  String _firebaseAuthErrorMessage(FirebaseAuthException error) {
    final message = error.message?.trim();
    if (message != null && message.isNotEmpty) {
      return 'Could not sign in anonymously: $message';
    }

    return 'Could not sign in anonymously: ${error.code}.';
  }

  String _buildPrompt(String heroineName, HeroineSelections selections) {
    final traitPool = selections.selectedTraitLabels.isEmpty
        ? MockHeroineData.traits
        : selections.selectedTraitLabels;
    final payload = {
      'heroineName': heroineName,
      'ageRange': selections.ageLabel,
      'gender': selections.genderLabel,
      'currentFocus': selections.focusLabel,
      'currentMood': selections.moodLabel,
      'aestheticResonance': selections.aestheticLabel,
      'visualStyle': selections.visualStyleLabel,
      'archetype': selections.archetypeLabel,
      'paletteColorArgb': selections.paletteColorValue,
      'personalityTraits': traitPool,
    };

    return '''
You write refined, emotionally grounded character copy for the Heroine Studio app.

Use every user selection below. Keep the tone elegant, intimate, and cinematic,
but avoid melodrama. Do not mention the app, questionnaires, AI, or the user.
Do not invent visual image prompts. The app uses static local images.

Return only valid JSON matching the provided schema.

Content constraints:
- name: use "$heroineName" unless it is unsafe or unreadable.
- archetype: use "${selections.archetypeLabel}" exactly.
- subtitle: one line, 3 to 5 words, combining visual style and inner theme.
- traits: pick 2 or 3 labels only from ${jsonEncode(traitPool)}.
- profile: 70 to 95 words, third person.
- greeting: 18 to 32 words, first person, no surrounding quotation marks.
- storySeed: 45 to 65 words, concrete narrative hook.

Selections:
${const JsonEncoder.withIndent('  ').convert(payload)}
''';
  }

  HeroineProfile _profileFromJson(
    Map<String, dynamic> json, {
    required String fallbackName,
    required HeroineSelections selections,
  }) {
    return HeroineProfile(
      name: _stringValue(json['name'], fallbackName, maxLength: 32),
      archetype: selections.archetypeLabel,
      subtitle: _stringValue(
        json['subtitle'],
        'The ${selections.visualStyleLabel} ${_archetypeNoun(selections)}',
        maxLength: 56,
      ),
      traits: _traitValues(json['traits'], selections),
      imageAsset: MockHeroineAssets.heroineResult,
      profile: _stringValue(
        json['profile'],
        MockHeroineData.generatedProfile.profile,
        maxLength: 900,
      ),
      greeting: _stringValue(
        json['greeting'],
        MockHeroineData.generatedProfile.greeting,
        maxLength: 360,
      ),
      storySeed: _stringValue(
        json['storySeed'],
        MockHeroineData.generatedProfile.storySeed,
        maxLength: 700,
      ),
    );
  }

  List<String> _traitValues(Object? value, HeroineSelections selections) {
    final allowed = selections.selectedTraitLabels.isEmpty
        ? MockHeroineData.traits
        : selections.selectedTraitLabels;
    if (value is List) {
      final normalized = value
          .whereType<String>()
          .where(allowed.contains)
          .take(3)
          .toList();
      if (normalized.length >= 2) {
        return normalized;
      }
    }

    return allowed.take(3).toList();
  }

  String _stringValue(
    Object? value,
    String fallback, {
    required int maxLength,
  }) {
    if (value is! String) {
      return fallback;
    }

    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return fallback;
    }

    if (trimmed.length <= maxLength) {
      return trimmed;
    }

    return trimmed.substring(0, maxLength).trimRight();
  }

  String _fallbackName(String name) {
    final trimmed = name.trim();
    return trimmed.isEmpty ? 'Unknown' : trimmed;
  }

  String _archetypeNoun(HeroineSelections selections) {
    return selections.archetypeLabel.replaceFirst('The ', '');
  }
}
