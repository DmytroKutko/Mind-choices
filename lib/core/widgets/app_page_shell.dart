import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_theme.dart';

final class AppPageShell extends StatelessWidget {
  const AppPageShell({required this.child, this.scroll = true, super.key});

  final Widget child;
  final bool scroll;

  @override
  Widget build(BuildContext context) {
    final content = SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppSpacing.maxContentWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.pageMargin,
              vertical: AppSpacing.md,
            ),
            child: child,
          ),
        ),
      ),
    );

    final body = scroll
        ? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: content,
          )
        : content;

    return Scaffold(body: body)
        .animate()
        .fadeIn(duration: 300.ms, curve: Curves.easeOutCubic)
        .slideY(
          begin: 0.02,
          end: 0,
          duration: 340.ms,
          curve: Curves.easeOutCubic,
        );
  }
}
