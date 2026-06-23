import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_selectable_tile.dart';

final class OptionChip extends StatelessWidget {
  const OptionChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.icon,
    super.key,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppSelectableTile(
      selected: selected,
      onTap: onTap,
      borderRadius: 999,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      selectedColor: AppColors.primary,
      unselectedColor: AppColors.surface,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 18,
              color: selected ? AppColors.onPrimary : AppColors.primary,
            ),
            const SizedBox(width: AppSpacing.base),
          ],
          Text(
            label,
            style: textTheme.labelMedium?.copyWith(
              color: selected ? AppColors.onPrimary : AppColors.primary,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
