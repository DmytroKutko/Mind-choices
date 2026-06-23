import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routing/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_action_button.dart';
import '../../data/mock_heroine_data.dart';
import '../../domain/heroine_models.dart';
import '../bloc/heroine_flow_cubit.dart';
import '../bloc/heroine_flow_state.dart';

final class SavedHeroineDetailScreen extends StatelessWidget {
  const SavedHeroineDetailScreen({super.key});

  static const _contentMaxWidth = 600.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeroineFlowCubit, HeroineFlowState>(
      builder: (context, state) {
        final savedHeroine = state.selectedSavedHeroine;
        final profile =
            savedHeroine?.profile ?? MockHeroineData.savedDetailProfile;
        final selections = savedHeroine?.selections;

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                _DetailHeader(profile: profile),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.pageMargin,
                      AppSpacing.md,
                      AppSpacing.pageMargin,
                      AppSpacing.lg,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: _contentMaxWidth,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _SavedHeroineCard(profile: profile),
                            const SizedBox(height: AppSpacing.lg),
                            _ChoicesPanel(selections: selections),
                            const SizedBox(height: AppSpacing.lg),
                            const _DetailSectionTitle('Character Profile'),
                            const SizedBox(height: AppSpacing.sm),
                            _DetailBodyText(profile.profile),
                            const SizedBox(height: AppSpacing.md),
                            _GreetingCard(profile.greeting),
                            const SizedBox(height: AppSpacing.xl),
                            AppActionButton(
                              label: 'Edit Profile',
                              icon: Icons.edit_outlined,
                              onPressed: () => context.go(AppRoutes.userInputs),
                              variant: AppActionButtonVariant.secondary,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            AppActionButton(
                              label: 'Regenerate Greeting',
                              icon: Icons.refresh,
                              onPressed: () => context.go(AppRoutes.generating),
                              variant: AppActionButtonVariant.secondary,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            AppActionButton(
                              label: 'Delete Heroine',
                              icon: Icons.delete_outline,
                              onPressed: () async {
                                if (savedHeroine != null) {
                                  await context
                                      .read<HeroineFlowCubit>()
                                      .deleteSavedHeroine(savedHeroine.id);
                                }
                                if (context.mounted) {
                                  context.go(AppRoutes.start);
                                }
                              },
                              variant: AppActionButtonVariant.danger,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

final class _DetailHeader extends StatelessWidget {
  const _DetailHeader({required this.profile});

  final HeroineProfile profile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: AppColors.background,
      child: Column(
        children: [
          SizedBox(
            height: 56,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.pageMargin,
              ),
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => context.go(AppRoutes.start),
                      customBorder: const CircleBorder(),
                      splashColor: AppColors.primary.withValues(alpha: 0.08),
                      highlightColor: AppColors.primary.withValues(alpha: 0.04),
                      child: const SizedBox.square(
                        dimension: 40,
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.primary,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.base),
                  Expanded(
                    child: Text(
                      profile.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleLarge?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 26 / 20,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.cloud_done_outlined,
                    color: AppColors.outline,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.outlineVariant,
          ),
        ],
      ),
    );
  }
}

final class _SavedHeroineCard extends StatelessWidget {
  const _SavedHeroineCard({required this.profile});

  final HeroineProfile profile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: Image.asset(profile.imageAsset, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: 30,
                    height: 36 / 30,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  profile.subtitle,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.base,
                  runSpacing: AppSpacing.base,
                  children: [
                    for (final trait in profile.traits) _DetailChip(trait),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final class _DetailChip extends StatelessWidget {
  const _DetailChip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final pink = label == 'Mage';

    return DecoratedBox(
      decoration: BoxDecoration(
        color: pink ? AppColors.secondaryFixed : AppColors.tertiaryContainer,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: pink ? AppColors.secondary : AppColors.onTertiaryContainer,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 16 / 12,
            letterSpacing: 1.4,
          ),
        ),
      ),
    );
  }
}

final class _ChoicesPanel extends StatelessWidget {
  const _ChoicesPanel({required this.selections});

  final HeroineSelections? selections;

  @override
  Widget build(BuildContext context) {
    final choices = selections == null
        ? const [
            _ChoiceRow(label: 'Archetype', value: 'Mage'),
            _ChoiceRow(label: 'Core Strength', value: 'Strategic'),
            _ChoiceRow(label: 'Temperament', value: 'Stoic'),
          ]
        : [
            _ChoiceRow(label: 'Age Range', value: selections!.ageLabel),
            _ChoiceRow(label: 'Gender', value: selections!.genderLabel),
            _ChoiceRow(label: 'Current Focus', value: selections!.focusLabel),
            _ChoiceRow(label: 'Mood', value: selections!.moodLabel),
            _ChoiceRow(label: 'Aesthetic', value: selections!.aestheticLabel),
            _ChoiceRow(
              label: 'Visual Style',
              value: selections!.visualStyleLabel,
            ),
            _ChoiceRow(label: 'Archetype', value: selections!.archetypeLabel),
          ];

    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          childrenPadding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            0,
            AppSpacing.md,
            AppSpacing.md,
          ),
          title: Text(
            'Your Choices',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
          children: choices,
        ),
      ),
    );
  }
}

final class _ChoiceRow extends StatelessWidget {
  const _ChoiceRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: textTheme.bodyMedium?.copyWith(color: AppColors.outline),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _DetailSectionTitle extends StatelessWidget {
  const _DetailSectionTitle(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.outlineVariant)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontSize: 22, height: 28 / 22),
          ),
        ),
      ),
    );
  }
}

final class _DetailBodyText extends StatelessWidget {
  const _DetailBodyText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.primary,
        height: 28 / 16,
      ),
    );
  }
}

final class _GreetingCard extends StatelessWidget {
  const _GreetingCard(this.greeting);

  final String greeting;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        border: Border(left: BorderSide(color: AppColors.primary)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Greeting',
              style: textTheme.titleLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '"$greeting"',
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.primary,
                fontStyle: FontStyle.italic,
                height: 24 / 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
