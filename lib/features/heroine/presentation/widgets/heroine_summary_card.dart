import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/heroine_models.dart';

final class HeroineSummaryCard extends StatelessWidget {
  const HeroineSummaryCard({
    required this.heroine,
    required this.onTap,
    super.key,
  });

  final SavedHeroine heroine;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final profile = heroine.profile;

    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.primary.withValues(alpha: 0.08),
        highlightColor: AppColors.primary.withValues(alpha: 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Image.asset(profile.imageAsset, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Saved Heroine',
                    style: textTheme.labelMedium?.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(profile.name, style: textTheme.headlineMedium),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    profile.subtitle,
                    style: textTheme.titleLarge?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        size: 16,
                        color: AppColors.outline,
                      ),
                      const SizedBox(width: AppSpacing.base),
                      Text(
                        _updatedLabel(heroine.updatedAt),
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColors.outline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _updatedLabel(DateTime updatedAt) {
    final difference = DateTime.now().toUtc().difference(updatedAt.toUtc());
    if (difference.inMinutes < 1) {
      return 'Updated just now';
    }
    if (difference.inHours < 1) {
      return 'Updated ${difference.inMinutes} min ago';
    }
    if (difference.inDays < 1) {
      return 'Updated ${difference.inHours} hours ago';
    }

    return 'Updated ${difference.inDays} days ago';
  }
}
