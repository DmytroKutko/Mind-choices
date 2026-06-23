import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

enum AppActionButtonVariant { primary, secondary, text, danger }

final class AppActionButton extends StatelessWidget {
  const AppActionButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = AppActionButtonVariant.primary,
    this.borderRadius = 10,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final AppActionButtonVariant variant;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final enabled = onPressed != null;
    final colors = _colors();
    final radius = BorderRadius.circular(borderRadius);

    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      child: Material(
        color: enabled ? colors.background : AppColors.surfaceContainerHigh,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(color: colors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onPressed,
          borderRadius: radius,
          splashColor: colors.foreground.withValues(alpha: 0.10),
          highlightColor: colors.foreground.withValues(alpha: 0.06),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOutCubic,
            constraints: const BoxConstraints(minHeight: 56),
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 18, color: colors.foreground),
                  const SizedBox(width: AppSpacing.base),
                ],
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.titleLarge?.copyWith(
                      color: colors.foreground,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _ButtonColors _colors() {
    return switch (variant) {
      AppActionButtonVariant.primary => const _ButtonColors(
        background: AppColors.primaryContainer,
        foreground: AppColors.onPrimary,
        border: AppColors.primaryContainer,
      ),
      AppActionButtonVariant.secondary => const _ButtonColors(
        background: Colors.transparent,
        foreground: AppColors.primary,
        border: AppColors.outlineVariant,
      ),
      AppActionButtonVariant.text => const _ButtonColors(
        background: Colors.transparent,
        foreground: AppColors.secondary,
        border: Colors.transparent,
      ),
      AppActionButtonVariant.danger => const _ButtonColors(
        background: Colors.transparent,
        foreground: AppColors.error,
        border: Colors.transparent,
      ),
    };
  }
}

final class _ButtonColors {
  const _ButtonColors({
    required this.background,
    required this.foreground,
    required this.border,
  });

  final Color background;
  final Color foreground;
  final Color border;
}
