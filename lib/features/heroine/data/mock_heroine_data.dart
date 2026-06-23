import 'package:flutter/material.dart';

import '../domain/heroine_models.dart';

abstract final class MockHeroineAssets {
  static const startSilhouette = 'assets/images/mock/start_silhouette.png';
  static const savedHeroine = 'assets/images/mock/saved_heroine.png';
  static const heroinePreview = 'assets/images/mock/heroine_preview.png';
  static const heroineResult = 'assets/images/mock/heroine_result.png';
  static const savedConfirmation = 'assets/images/mock/saved_confirmation.png';
  static const softRomantic = 'assets/images/mock/aesthetic_soft_romantic.png';
  static const minimalGrounded =
      'assets/images/mock/aesthetic_minimal_grounded.png';
  static const lightAiry = 'assets/images/mock/aesthetic_light_airy.png';
}

abstract final class MockHeroineData {
  static const ageRanges = ['18-24', '25-34', '35-44', '45-54', '55+'];
  static const genders = ['Woman', 'Non-binary', 'Other'];
  static const moods = [
    'Tired but hopeful',
    'Curious',
    'Overwhelmed',
    'Seeking clarity',
    'Ready for change',
  ];
  static const visualStyles = ['Classic', 'Modern', 'Mystic', 'Elegant'];
  static const traits = [
    'Brave',
    'Reflective',
    'Compassionate',
    'Intuitive',
    'Fierce',
    'Stoic',
  ];
  static const palettes = [
    Color(0xfff4b6c1),
    Color(0xffb9ccac),
    Color(0xff332034),
    Color(0xffe7e1e3),
  ];

  static const focusOptions = [
    FocusOption(label: 'Confidence', icon: Icons.auto_awesome),
    FocusOption(label: 'Boundaries', icon: Icons.fence),
    FocusOption(label: 'New beginning', icon: Icons.flare),
    FocusOption(label: 'Self-worth', icon: Icons.favorite_border),
  ];

  static const aestheticOptions = [
    AestheticOption(
      label: 'Soft romantic',
      assetPath: MockHeroineAssets.softRomantic,
    ),
    AestheticOption(
      label: 'Minimal and grounded',
      assetPath: MockHeroineAssets.minimalGrounded,
    ),
    AestheticOption(label: 'Deep focus', backgroundColor: Color(0xff4b2637)),
    AestheticOption(
      label: 'Light and airy',
      assetPath: MockHeroineAssets.lightAiry,
    ),
  ];

  static const archetypes = [
    ArchetypeOption(
      title: 'The Queen',
      description: 'Leads with grace and unyielding authority.',
    ),
    ArchetypeOption(
      title: 'The Seeker',
      description: 'Driven by curiosity and profound truth.',
    ),
    ArchetypeOption(
      title: 'The Creator',
      description: 'Manifests new realities from imagination.',
    ),
    ArchetypeOption(
      title: 'The Sage',
      description: 'Offers wisdom born of quiet reflection.',
    ),
  ];

  static const generatedProfile = HeroineProfile(
    name: 'Elara',
    archetype: 'The Seeker',
    subtitle: 'The Modern Mystic',
    traits: ['Reflective', 'Intuitive', 'Introspective'],
    imageAsset: MockHeroineAssets.heroineResult,
    profile:
        'Elara is defined by a restless curiosity and an unyielding desire to understand the hidden layers of the world. She observes more than she speaks, absorbing the subtle shifts in her environment. Her strength lies not in force, but in her capacity to endure uncertainty and piece together fragments of lost truths.',
    greeting:
        "I suppose we are looking for the same thing, you and I. The question isn't where we start, but whether we have the courage to look closely at what we find.",
    storySeed:
        'It begins with a rusted key found buried in the roots of an ancient oak tree behind her childhood home. The key matches no known lock, yet it resonates with a faint, almost imperceptible hum when pointed toward the northern mountains. This small anomaly is enough to unravel her quiet life.',
  );

  static const savedDetailProfile = HeroineProfile(
    name: 'Elenora Vance',
    archetype: 'Mage',
    subtitle: 'The Architect of Shadows',
    traits: ['Stoic', 'Strategic', 'Mage'],
    imageAsset: MockHeroineAssets.savedHeroine,
    profile:
        "Elenora was born in the silent city of Oakhaven, where books were valued more than gold. Raised amidst towering shelves and dust-motes dancing in shafts of sunlight, she learned the power of the written word before she could speak.\n\nHer journey began when she discovered a volume that wasn't meant to be found: a ledger of shadows that detailed a history erased by the ruling council. Driven by an insatiable need for the truth, she left the comfort of her archives, trading her reading spectacles for a traveler's cloak.",
    greeting:
        "The truth is rarely simple, and never safe. But if you walk with me, I promise you won't walk in the dark for long.",
    storySeed: '',
  );
}
