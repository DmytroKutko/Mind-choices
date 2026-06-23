import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routing/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_action_button.dart';
import '../../data/mock_heroine_data.dart';
import '../bloc/heroine_flow_cubit.dart';
import '../bloc/heroine_flow_state.dart';
import '../widgets/heroine_summary_card.dart';

final class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeroineFlowCubit, HeroineFlowState>(
      builder: (context, state) {
        if (!state.hasSavedHeroine) {
          return const _EmptyStartView();
        }

        return _SavedStartView(state: state);
      },
    );
  }
}

final class _EmptyStartView extends StatelessWidget {
  const _EmptyStartView();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return _StartScaffold(
      bottomActions: _StartPrimaryActionButton(
        label: 'Start',
        onTap: () => context.go(AppRoutes.userInputs),
      ),
      bottomActionsHeight: 56,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text(
            'MindChoices',
            textAlign: TextAlign.center,
            style: textTheme.displayLarge,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                final compact = constraints.maxHeight < 460;
                final imageHeight = compact ? 200.0 : 296.0;
                final imageWidth = compact ? 152.0 : 224.0;
                final contentGap = compact ? AppSpacing.md : AppSpacing.xl;

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _StartHeroImage(width: imageWidth, height: imageHeight),
                        SizedBox(height: contentGap),
                        Text(
                          'Create your heroine',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineMedium,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.base,
                          ),
                          child: Text(
                            'Shape a story character from your own goals, mood, and inner strengths.',
                            textAlign: TextAlign.center,
                            style: textTheme.bodyLarge?.copyWith(
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

final class _SavedStartView extends StatelessWidget {
  const _SavedStartView({required this.state});

  final HeroineFlowState state;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cubit = context.read<HeroineFlowCubit>();
    final firstHeroine = state.savedHeroines.first;

    return _StartScaffold(
      bottomActionsHeight: 116,
      bottomActions: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppActionButton(
            label: 'Continue saved heroine',
            onPressed: () {
              cubit.selectSavedHeroine(firstHeroine.id);
              context.go(AppRoutes.detail);
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          AppActionButton(
            label: 'Create a new heroine',
            onPressed: () => context.go(AppRoutes.userInputs),
            variant: AppActionButtonVariant.secondary,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpacing.lg),
          Text(
            'Welcome back',
            textAlign: TextAlign.center,
            style: textTheme.displayLarge,
          ),
          const SizedBox(height: AppSpacing.base),
          Text(
            'Continue your journey of self-discovery.',
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  for (final heroine in state.savedHeroines) ...[
                    HeroineSummaryCard(
                      heroine: heroine,
                      onTap: () {
                        cubit.selectSavedHeroine(heroine.id);
                        context.go(AppRoutes.detail);
                      },
                    ),
                    const SizedBox(height: AppSpacing.md),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final class _StartScaffold extends StatelessWidget {
  const _StartScaffold({
    required this.child,
    required this.bottomActions,
    required this.bottomActionsHeight,
  });

  final Widget child;
  final Widget bottomActions;
  final double bottomActionsHeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppSpacing.maxContentWidth,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      AppSpacing.pageMargin,
                      0,
                      AppSpacing.pageMargin,
                      bottomActionsHeight + AppSpacing.lg,
                    ),
                    child: child,
                  ),
                ),
                Positioned(
                  left: AppSpacing.pageMargin,
                  right: AppSpacing.pageMargin,
                  bottom: AppSpacing.md,
                  child: bottomActions,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final class _StartPrimaryActionButton extends StatelessWidget {
  const _StartPrimaryActionButton({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: AppColors.primaryContainer,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        splashColor: AppColors.onPrimary.withValues(alpha: 0.12),
        highlightColor: AppColors.onPrimary.withValues(alpha: 0.06),
        child: SizedBox(
          height: 56,
          child: Center(
            child: Text(
              label,
              style: textTheme.titleLarge?.copyWith(
                color: AppColors.onPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _StartHeroImage extends StatelessWidget {
  const _StartHeroImage({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: width,
          height: height,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.outlineVariant),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.sm),
              child: ColorFiltered(
                colorFilter: const ColorFilter.matrix([
                  0.2126,
                  0.7152,
                  0.0722,
                  0,
                  0,
                  0.2126,
                  0.7152,
                  0.0722,
                  0,
                  0,
                  0.2126,
                  0.7152,
                  0.0722,
                  0,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                ]),
                child: Opacity(
                  opacity: 0.9,
                  child: Image.asset(
                    MockHeroineAssets.startSilhouette,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        )
        .animate()
        .fadeIn(duration: 420.ms)
        .scaleXY(
          begin: 0.985,
          end: 1,
          duration: 420.ms,
          curve: Curves.easeOutCubic,
        );
  }
}
