import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routing/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_action_button.dart';
import '../../../../core/widgets/app_page_shell.dart';
import '../../data/mock_heroine_data.dart';
import '../bloc/heroine_flow_cubit.dart';
import '../bloc/heroine_flow_state.dart';

final class SavedConfirmationScreen extends StatelessWidget {
  const SavedConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<HeroineFlowCubit, HeroineFlowState>(
      builder: (context, state) {
        final savedHeroine = state.selectedSavedHeroine;
        final profile =
            savedHeroine?.profile ?? MockHeroineData.generatedProfile;
        final isSynced = savedHeroine?.pendingSync == false;

        return AppPageShell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.md),
              Center(
                child:
                    Material(
                          color: AppColors.tertiaryContainer.withValues(
                            alpha: 0.55,
                          ),
                          shape: const CircleBorder(),
                          child: const SizedBox.square(
                            dimension: 72,
                            child: Icon(
                              Icons.check,
                              size: 40,
                              color: AppColors.onTertiaryContainer,
                            ),
                          ),
                        )
                        .animate()
                        .scaleXY(
                          begin: 0.7,
                          end: 1,
                          duration: 320.ms,
                          curve: Curves.easeOutBack,
                        )
                        .fadeIn(duration: 220.ms),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Heroine saved',
                textAlign: TextAlign.center,
                style: textTheme.displayLarge?.copyWith(fontSize: 40),
              ),
              const SizedBox(height: AppSpacing.base),
              Text(
                'You can return to her story anytime.',
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Material(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(8),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          profile.imageAsset,
                          width: 92,
                          height: 112,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(profile.name, style: textTheme.titleLarge),
                            const SizedBox(height: AppSpacing.base),
                            Wrap(
                              spacing: AppSpacing.base,
                              children: [
                                _SmallChip(profile.archetype),
                                const _SmallChip('Introspective'),
                              ],
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              profile.subtitle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.bodySmall?.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.base),
                            Text(
                              _savedAtLabel(savedHeroine?.updatedAt),
                              style: textTheme.bodySmall?.copyWith(
                                color: AppColors.outline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _StatusItem(icon: Icons.cloud_done, label: 'Saved locally'),
                  const SizedBox(width: AppSpacing.md),
                  _StatusItem(
                    icon: Icons.sync,
                    label: isSynced ? 'Synced to Firebase' : 'Sync pending',
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              AppActionButton(
                label: 'View heroine',
                onPressed: () => context.go(AppRoutes.detail),
              ),
              const SizedBox(height: AppSpacing.sm),
              AppActionButton(
                label: 'Create another',
                onPressed: () => context.go(AppRoutes.userInputs),
                variant: AppActionButtonVariant.secondary,
              ),
            ],
          ),
        );
      },
    );
  }

  String _savedAtLabel(DateTime? savedAt) {
    if (savedAt == null) {
      return 'Saved just now';
    }

    final difference = DateTime.now().toUtc().difference(savedAt.toUtc());
    if (difference.inMinutes < 1) {
      return 'Saved just now';
    }
    if (difference.inHours < 1) {
      return 'Saved ${difference.inMinutes} min ago';
    }
    if (difference.inDays < 1) {
      return 'Saved ${difference.inHours} hours ago';
    }

    return 'Saved ${difference.inDays} days ago';
  }
}

final class _SmallChip extends StatelessWidget {
  const _SmallChip(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.tertiaryContainer.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: 2,
        ),
        child: Text(
          label.toUpperCase(),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.onTertiaryContainer,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

final class _StatusItem extends StatelessWidget {
  const _StatusItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: AppColors.onTertiaryContainer),
        const SizedBox(width: AppSpacing.xs),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }
}
