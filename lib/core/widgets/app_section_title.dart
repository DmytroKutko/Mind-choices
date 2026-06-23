import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

final class AppSectionTitle extends StatelessWidget {
  const AppSectionTitle(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.centerLeft,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.outlineVariant)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: Text(label, style: textTheme.titleLarge),
        ),
      ),
    );
  }
}
