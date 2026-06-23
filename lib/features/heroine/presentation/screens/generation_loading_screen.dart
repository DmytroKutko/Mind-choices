import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routing/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_action_button.dart';
import '../../../../core/widgets/app_page_shell.dart';
import '../../data/mock_heroine_data.dart';
import '../bloc/heroine_flow_cubit.dart';
import '../bloc/heroine_flow_state.dart';

final class GenerationLoadingScreen extends StatefulWidget {
  const GenerationLoadingScreen({super.key});

  @override
  State<GenerationLoadingScreen> createState() =>
      _GenerationLoadingScreenState();
}

final class _GenerationLoadingScreenState
    extends State<GenerationLoadingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<HeroineFlowCubit>().generateProfile();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<HeroineFlowCubit, HeroineFlowState>(
      listenWhen: (previous, current) =>
          previous.generationStatus != current.generationStatus,
      listener: (context, state) {
        if (state.generationStatus == HeroineGenerationStatus.success) {
          context.go(AppRoutes.result);
        }
      },
      builder: (context, state) {
        final hasError =
            state.generationStatus == HeroineGenerationStatus.failure;

        return AppPageShell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: _AiGenerationAnimation(size: 64)),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Writing her first words...',
                textAlign: TextAlign.center,
                style: textTheme.displayLarge?.copyWith(fontSize: 36),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                hasError
                    ? state.generationError ??
                          'Could not generate the heroine profile.'
                    : 'AI is shaping a short profile from your choices.',
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Material(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Selections', style: textTheme.titleLarge),
                      const SizedBox(height: AppSpacing.sm),
                      _SelectionLine(MockHeroineData.ageRanges[state.ageIndex]),
                      _SelectionLine(
                        MockHeroineData.focusOptions[state.focusIndex].label,
                      ),
                      _SelectionLine(
                        MockHeroineData
                            .aestheticOptions[state.aestheticIndex]
                            .label,
                      ),
                      _SelectionLine(
                        MockHeroineData.archetypes[state.archetypeIndex].title,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              if (hasError) ...[
                AppActionButton(
                  label: 'Try again',
                  onPressed: () =>
                      context.read<HeroineFlowCubit>().generateProfile(),
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
              AppActionButton(
                label: 'Cancel',
                onPressed: () => context.go(AppRoutes.customization),
                variant: AppActionButtonVariant.text,
              ),
            ],
          ),
        );
      },
    );
  }
}

final class _AiGenerationAnimation extends StatefulWidget {
  const _AiGenerationAnimation({required this.size});

  final double size;

  @override
  State<_AiGenerationAnimation> createState() => _AiGenerationAnimationState();
}

final class _AiGenerationAnimationState extends State<_AiGenerationAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox.square(
        dimension: widget.size,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: _AiGenerationPainter(progress: _controller.value),
            );
          },
        ),
      ),
    );
  }
}

final class _AiGenerationPainter extends CustomPainter {
  const _AiGenerationPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final shortestSide = math.min(size.width, size.height);
    final center = Offset(size.width / 2, size.height / 2);
    final rotation = progress * math.pi * 2;
    final pulse = 0.5 + 0.5 * math.sin(rotation);

    final ringRect = Rect.fromCircle(
      center: center,
      radius: shortestSide * 0.36,
    );
    final ringPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = shortestSide * 0.035;

    canvas.drawArc(
      ringRect,
      rotation - math.pi / 2,
      math.pi * 0.82,
      false,
      ringPaint..color = AppColors.primaryFixedDim.withValues(alpha: 0.34),
    );
    canvas.drawArc(
      ringRect,
      rotation + math.pi * 0.72,
      math.pi * 0.46,
      false,
      ringPaint..color = AppColors.primaryContainer.withValues(alpha: 0.26),
    );

    _drawSparkle(
      canvas,
      center,
      shortestSide * (0.18 + pulse * 0.018),
      AppColors.primaryContainer.withValues(alpha: 0.86),
    );

    for (final sparkle in _orbitingSparkles) {
      final localProgress = (progress + sparkle.phase) % 1;
      final angle = localProgress * math.pi * 2 + sparkle.angleOffset;
      final orbit = Offset(math.cos(angle), math.sin(angle));
      final opacity =
          0.38 + 0.46 * (0.5 + 0.5 * math.sin(localProgress * math.pi * 2));

      _drawSparkle(
        canvas,
        center + orbit * shortestSide * sparkle.radiusFactor,
        shortestSide * sparkle.sizeFactor,
        AppColors.primaryFixedDim.withValues(alpha: opacity),
      );
    }

    final dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = AppColors.secondaryFixedDim.withValues(alpha: 0.62);
    for (var i = 0; i < 6; i++) {
      final angle = rotation + i * math.pi / 3;
      final radius = shortestSide * (0.22 + 0.02 * math.sin(rotation + i));
      canvas.drawCircle(
        center + Offset(math.cos(angle), math.sin(angle)) * radius,
        shortestSide * 0.018,
        dotPaint,
      );
    }
  }

  void _drawSparkle(Canvas canvas, Offset center, double radius, Color color) {
    final innerRadius = radius * 0.34;
    final path = Path();

    for (var i = 0; i < 8; i++) {
      final pointRadius = i.isEven ? radius : innerRadius;
      final angle = -math.pi / 2 + i * math.pi / 4;
      final point = Offset(
        center.dx + math.cos(angle) * pointRadius,
        center.dy + math.sin(angle) * pointRadius,
      );

      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    path.close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _AiGenerationPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

final class _OrbitingSparkle {
  const _OrbitingSparkle({
    required this.radiusFactor,
    required this.sizeFactor,
    required this.phase,
    required this.angleOffset,
  });

  final double radiusFactor;
  final double sizeFactor;
  final double phase;
  final double angleOffset;
}

const _orbitingSparkles = [
  _OrbitingSparkle(
    radiusFactor: 0.42,
    sizeFactor: 0.072,
    phase: 0,
    angleOffset: -0.3,
  ),
  _OrbitingSparkle(
    radiusFactor: 0.33,
    sizeFactor: 0.052,
    phase: 0.34,
    angleOffset: 0.9,
  ),
  _OrbitingSparkle(
    radiusFactor: 0.28,
    sizeFactor: 0.044,
    phase: 0.68,
    angleOffset: -1.2,
  ),
];

final class _SelectionLine extends StatelessWidget {
  const _SelectionLine(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: AppColors.outline,
            size: 20,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              label,
              style: textTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
