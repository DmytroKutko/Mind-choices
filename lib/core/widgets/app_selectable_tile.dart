import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

final class AppSelectableTile extends StatelessWidget {
  const AppSelectableTile({
    required this.selected,
    required this.onTap,
    required this.child,
    this.borderRadius = 8,
    this.padding = const EdgeInsets.all(AppSpacing.sm),
    this.selectedColor = AppColors.surface,
    this.unselectedColor = AppColors.surface,
    super.key,
  });

  final bool selected;
  final VoidCallback onTap;
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final Color selectedColor;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    return AnimatedScale(
      scale: selected ? 1.01 : 1,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOutCubic,
      child: Material(
        color: selected ? selectedColor : unselectedColor,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: selected ? AppColors.primary : AppColors.outlineVariant,
            width: selected ? 1.4 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          splashColor: AppColors.primary.withValues(alpha: 0.08),
          highlightColor: AppColors.primary.withValues(alpha: 0.04),
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
