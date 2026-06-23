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

final class HeroineResultScreen extends StatelessWidget {
  const HeroineResultScreen({super.key});

  static const _contentMaxWidth = 600.0;
  static const _cardMaxWidth = 420.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeroineFlowCubit, HeroineFlowState>(
      builder: (context, state) {
        final profile =
            state.generatedProfile ?? MockHeroineData.generatedProfile;

        return _ResultView(profile: profile);
      },
    );
  }
}

final class _ResultView extends StatelessWidget {
  const _ResultView({required this.profile});

  final HeroineProfile profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _ResultHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.pageMargin,
                  AppSpacing.lg,
                  AppSpacing.pageMargin,
                  AppSpacing.lg,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: HeroineResultScreen._contentMaxWidth,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const _ResultIntro(),
                        const SizedBox(height: AppSpacing.lg),
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: HeroineResultScreen._cardMaxWidth,
                            ),
                            child: _HeroineProfileCard(profile: profile),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        const _ResultSectionTitle('Her Profile'),
                        const SizedBox(height: AppSpacing.sm),
                        _ResultBodyText(profile.profile),
                        const SizedBox(height: AppSpacing.lg),
                        _GreetingCard(profile.greeting),
                        const SizedBox(height: AppSpacing.lg),
                        const _ResultSectionTitle('Story Seed'),
                        const SizedBox(height: AppSpacing.sm),
                        _ResultBodyText(profile.storySeed),
                        const SizedBox(height: AppSpacing.xl),
                        AppActionButton(
                          label: 'Save heroine',
                          onPressed: () async {
                            await context.read<HeroineFlowCubit>().markSaved(
                              profile,
                            );
                            if (context.mounted) {
                              context.go(AppRoutes.saved);
                            }
                          },
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        AppActionButton(
                          label: 'Regenerate',
                          onPressed: () => context.go(AppRoutes.generating),
                          variant: AppActionButtonVariant.secondary,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        AppActionButton(
                          label: 'Edit choices',
                          onPressed: () => context.go(AppRoutes.userInputs),
                          variant: AppActionButtonVariant.text,
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        Text(
                          'Generated from your selected inputs.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.outline),
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
  }
}

final class _ResultHeader extends StatelessWidget {
  const _ResultHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: AppColors.background,
      child: Column(
        children: [
          SizedBox(
            height: 52,
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
                      onTap: () => context.go(AppRoutes.customization),
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
                  Expanded(
                    child: Text(
                      'Step 3 of 3',
                      textAlign: TextAlign.center,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        height: 20 / 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
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

final class _ResultIntro extends StatelessWidget {
  const _ResultIntro();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          'Profile Ready',
          textAlign: TextAlign.center,
          style: textTheme.headlineSmall?.copyWith(
            fontSize: 28,
            height: 36 / 28,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Meet the protagonist of your next journey.',
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

final class _HeroineProfileCard extends StatelessWidget {
  const _HeroineProfileCard({required this.profile});

  final HeroineProfile profile;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 0.8,
            child: Image.asset(profile.imageAsset, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.base * 2,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: Column(
              children: [
                _LabelPill(profile.archetype),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  profile.name,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineSmall?.copyWith(
                    fontSize: 28,
                    height: 34 / 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final class _ResultSectionTitle extends StatelessWidget {
  const _ResultSectionTitle(this.label);

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

final class _ResultBodyText extends StatelessWidget {
  const _ResultBodyText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.onSurfaceVariant,
        height: 26 / 16,
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
              'HER FIRST GREETING',
              style: textTheme.labelMedium?.copyWith(
                color: AppColors.outline,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              '"$greeting"',
              style: textTheme.headlineSmall?.copyWith(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                height: 30 / 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _LabelPill extends StatelessWidget {
  const _LabelPill(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.tertiaryContainer,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.onTertiaryContainer,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            height: 14 / 11,
            letterSpacing: 1.3,
          ),
        ),
      ),
    );
  }
}
