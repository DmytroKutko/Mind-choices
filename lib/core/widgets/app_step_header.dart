import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_theme.dart';

final class AppStepHeader extends StatelessWidget {
  const AppStepHeader({
    required this.title,
    required this.stepLabel,
    required this.progress,
    this.backRoute,
    super.key,
  });

  final String title;
  final String stepLabel;
  final double progress;
  final String? backRoute;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: backRoute == null ? null : () => context.go(backRoute!),
                customBorder: const CircleBorder(),
                child: const SizedBox.square(
                  dimension: 44,
                  child: Icon(Icons.arrow_back, color: AppColors.primary),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(child: Text(title, style: textTheme.headlineSmall)),
            Text(
              stepLabel,
              style: textTheme.bodySmall?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(milliseconds: 420),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 4,
                backgroundColor: AppColors.surfaceContainerHigh,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.tertiaryContainer,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
