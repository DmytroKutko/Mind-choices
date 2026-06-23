import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routing/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/mock_heroine_data.dart';
import '../bloc/heroine_flow_cubit.dart';
import '../bloc/heroine_flow_state.dart';

final class UserInputsScreen extends StatelessWidget {
  const UserInputsScreen({super.key});

  static const _contentMaxWidth = 600.0;
  static const _bottomActionHeight = 112.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeroineFlowCubit, HeroineFlowState>(
      builder: (context, state) {
        final cubit = context.read<HeroineFlowCubit>();

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const _StepOneHeader(),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(
                            AppSpacing.pageMargin,
                            AppSpacing.lg,
                            AppSpacing.pageMargin,
                            _bottomActionHeight + AppSpacing.lg,
                          ),
                          child: Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: _contentMaxWidth,
                              ),
                              child: _StepOneContent(
                                state: state,
                                cubit: cubit,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: _FixedBottomContinue(
                          onTap: () => context.go(AppRoutes.customization),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

final class _StepOneHeader extends StatelessWidget {
  const _StepOneHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      color: AppColors.background,
      child: Column(
        children: [
          SizedBox(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.pageMargin,
              ),
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () => context.go(AppRoutes.start),
                      customBorder: const CircleBorder(),
                      splashColor: AppColors.primary.withValues(alpha: 0.08),
                      highlightColor: AppColors.primary.withValues(alpha: 0.04),
                      child: const SizedBox.square(
                        dimension: 40,
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.primary,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Personalize',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall?.copyWith(
                            fontSize: 20,
                            height: 26 / 20,
                          ),
                        ),
                        Text(
                          'Step 1 of 3',
                          textAlign: TextAlign.center,
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.onSurfaceVariant,
                            height: 16 / 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.outlineVariant,
          ),
          Stack(
            children: [
              const SizedBox(
                height: 4,
                width: double.infinity,
                child: ColoredBox(color: AppColors.surfaceContainerHigh),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1 / 3),
                duration: const Duration(milliseconds: 420),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return FractionallySizedBox(
                    widthFactor: value,
                    child: const SizedBox(
                      height: 4,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xff7d8f72),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(999),
                            bottomRight: Radius.circular(999),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final class _StepOneContent extends StatelessWidget {
  const _StepOneContent({required this.state, required this.cubit});

  final HeroineFlowState state;
  final HeroineFlowCubit cubit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Tell us about yourself',
          textAlign: TextAlign.center,
          style: textTheme.headlineMedium,
        ),
        const SizedBox(height: AppSpacing.base),
        Text(
          'This helps us tailor your journey to your unique needs.',
          textAlign: TextAlign.center,
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        const _SectionTitle('Age Range'),
        const SizedBox(height: AppSpacing.sm),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          child: Row(
            children: [
              for (var i = 0; i < MockHeroineData.ageRanges.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: _ChoiceChip(
                    label: MockHeroineData.ageRanges[i],
                    selected: state.ageIndex == i,
                    minWidth: 76,
                    onTap: () => cubit.selectAge(i),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        const _SectionTitle('Gender'),
        const SizedBox(height: AppSpacing.md),
        _GenderSegmentedControl(
          options: MockHeroineData.genders,
          selectedIndex: state.genderIndex,
          onSelected: cubit.selectGender,
        ),
        const SizedBox(height: AppSpacing.xl),
        const _SectionTitle('Current Focus'),
        const SizedBox(height: AppSpacing.sm),
        Column(
          children: [
            for (var i = 0; i < MockHeroineData.focusOptions.length; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: _FocusTile(
                  index: i,
                  selected: state.focusIndex == i,
                  onTap: () => cubit.selectFocus(i),
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        const _SectionTitle('How are you feeling lately?'),
        const SizedBox(height: AppSpacing.sm),
        _MoodChoices(
          selectedIndex: state.moodIndex,
          onSelected: cubit.selectMood,
        ),
        const SizedBox(height: AppSpacing.xl),
        const _SectionTitle('Aesthetic Resonance'),
        const SizedBox(height: AppSpacing.base),
        Text(
          'Select a visual mood that calms you.',
          style: textTheme.bodyMedium?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        _AestheticGrid(
          selectedIndex: state.aestheticIndex,
          onSelected: cubit.selectAesthetic,
        ),
      ],
    );
  }
}

final class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffddd0c2))),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xs),
          child: Text(label, style: Theme.of(context).textTheme.titleLarge),
        ),
      ),
    );
  }
}

final class _ChoiceChip extends StatelessWidget {
  const _ChoiceChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.minWidth,
    this.selectedColor = AppColors.primary,
    this.selectedForeground = AppColors.onPrimary,
    this.unselectedForeground = AppColors.primary,
    this.textStyle,
    this.fillWidth = false,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final double? minWidth;
  final Color selectedColor;
  final Color selectedForeground;
  final Color unselectedForeground;
  final TextStyle? textStyle;
  final bool fillWidth;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(8);
    final effectiveTextStyle =
        textStyle ?? Theme.of(context).textTheme.labelMedium;

    return Material(
      color: selected ? selectedColor : AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(
          color: selected ? AppColors.primary : const Color(0xffddd0c2),
          width: selected ? 1.5 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashColor: AppColors.primary.withValues(alpha: 0.08),
        highlightColor: AppColors.primary.withValues(alpha: 0.04),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: minWidth ?? 0, minHeight: 40),
          child: SizedBox(
            width: fillWidth ? double.infinity : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              child: Center(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: effectiveTextStyle?.copyWith(
                    color: selected ? selectedForeground : unselectedForeground,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _GenderSegmentedControl extends StatelessWidget {
  const _GenderSegmentedControl({
    required this.options,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const inset = 4.0;

    return SizedBox(
      height: 52,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = (constraints.maxWidth - inset * 2) / options.length;

          return Material(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(10),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                AnimatedPositioned(
                  left: inset + width * selectedIndex,
                  top: inset,
                  bottom: inset,
                  width: width,
                  duration: const Duration(milliseconds: 260),
                  curve: Curves.easeOutCubic,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: const Color(0xffddd0c2)),
                    ),
                  ),
                ),
                Row(
                  children: [
                    for (var i = 0; i < options.length; i++)
                      Expanded(
                        child: InkWell(
                          onTap: () => onSelected(i),
                          splashFactory: NoSplash.splashFactory,
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          enableFeedback: false,
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 180),
                              curve: Curves.easeOutCubic,
                              style:
                                  textTheme.labelMedium?.copyWith(
                                    color: selectedIndex == i
                                        ? AppColors.primary
                                        : AppColors.onSurfaceVariant,
                                    fontWeight: selectedIndex == i
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    letterSpacing: 0,
                                  ) ??
                                  const TextStyle(),
                              child: Text(options[i]),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

final class _FocusTile extends StatelessWidget {
  const _FocusTile({
    required this.index,
    required this.selected,
    required this.onTap,
  });

  final int index;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final option = MockHeroineData.focusOptions[index];
    final textTheme = Theme.of(context).textTheme;
    final radius = BorderRadius.circular(10);

    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(
          color: selected ? AppColors.primary : const Color(0xffddd0c2),
          width: selected ? 1.5 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashColor: AppColors.primary.withValues(alpha: 0.08),
        highlightColor: AppColors.primary.withValues(alpha: 0.04),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutCubic,
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: selected
                      ? AppColors.primaryFixed
                      : AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  option.icon,
                  size: 22,
                  color: selected
                      ? AppColors.primary
                      : AppColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  option.label,
                  style: textTheme.bodyMedium?.copyWith(
                    color: selected ? AppColors.primary : AppColors.onSurface,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 180),
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInCubic,
                child: selected
                    ? const _SelectedCircle(key: ValueKey('selected'))
                    : const _UnselectedCircle(key: ValueKey('unselected')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _SelectedCircle extends StatelessWidget {
  const _SelectedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.check, color: AppColors.onPrimary, size: 16),
      ),
    );
  }
}

final class _UnselectedCircle extends StatelessWidget {
  const _UnselectedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 24,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.outlineVariant),
        ),
      ),
    );
  }
}

final class _MoodChoices extends StatelessWidget {
  const _MoodChoices({required this.selectedIndex, required this.onSelected});

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: _MoodChip(
                label: MockHeroineData.moods[0],
                selected: selectedIndex == 0,
                textStyle: textTheme.bodyMedium,
                onTap: () => onSelected(0),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              flex: 3,
              child: _MoodChip(
                label: MockHeroineData.moods[1],
                selected: selectedIndex == 1,
                textStyle: textTheme.bodyMedium,
                onTap: () => onSelected(1),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: _MoodChip(
                label: MockHeroineData.moods[2],
                selected: selectedIndex == 2,
                textStyle: textTheme.bodyMedium,
                onTap: () => onSelected(2),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _MoodChip(
                label: MockHeroineData.moods[3],
                selected: selectedIndex == 3,
                textStyle: textTheme.bodyMedium,
                onTap: () => onSelected(3),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        FractionallySizedBox(
          widthFactor: 0.56,
          child: _MoodChip(
            label: MockHeroineData.moods[4],
            selected: selectedIndex == 4,
            textStyle: textTheme.bodyMedium,
            onTap: () => onSelected(4),
          ),
        ),
      ],
    );
  }
}

final class _MoodChip extends StatelessWidget {
  const _MoodChip({
    required this.label,
    required this.selected,
    required this.onTap,
    required this.textStyle,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return _ChoiceChip(
      label: label,
      selected: selected,
      onTap: onTap,
      selectedColor: AppColors.primaryFixedDim.withValues(alpha: 0.22),
      selectedForeground: AppColors.primary,
      unselectedForeground: AppColors.onSurfaceVariant,
      textStyle: textStyle,
      fillWidth: true,
    );
  }
}

final class _AestheticGrid extends StatelessWidget {
  const _AestheticGrid({required this.selectedIndex, required this.onSelected});

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 5,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisSpacing: AppSpacing.sm,
      ),
      itemCount: MockHeroineData.aestheticOptions.length,
      itemBuilder: (context, index) {
        return _AestheticCard(
          index: index,
          selected: selectedIndex == index,
          onTap: () => onSelected(index),
        );
      },
    );
  }
}

final class _AestheticCard extends StatelessWidget {
  const _AestheticCard({
    required this.index,
    required this.selected,
    required this.onTap,
  });

  final int index;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final option = MockHeroineData.aestheticOptions[index];
    final textTheme = Theme.of(context).textTheme;
    final radius = BorderRadius.circular(10);

    return Material(
      color: option.backgroundColor ?? AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(
          color: selected ? AppColors.primary : const Color(0xffddd0c2),
          width: selected ? 2 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashColor: AppColors.onPrimary.withValues(alpha: 0.10),
        highlightColor: AppColors.onPrimary.withValues(alpha: 0.05),
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (option.assetPath case final assetPath?)
              Image.asset(assetPath, fit: BoxFit.cover)
            else
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff332034), Color(0xff663a43)],
                  ),
                ),
              ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: selected ? 0.62 : 0.46),
                  ],
                ),
              ),
            ),
            Positioned(
              left: AppSpacing.sm,
              right: AppSpacing.sm,
              bottom: AppSpacing.sm,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      option.label,
                      style: textTheme.labelMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  AnimatedScale(
                    scale: selected ? 1 : 0.1,
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOutCubic,
                    child: AnimatedOpacity(
                      opacity: selected ? 1 : 0,
                      duration: const Duration(milliseconds: 160),
                      child: const SizedBox.square(
                        dimension: 24,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            color: AppColors.onPrimary,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _FixedBottomContinue extends StatelessWidget {
  const _FixedBottomContinue({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background.withValues(alpha: 0),
            AppColors.background.withValues(alpha: 0.94),
            AppColors.background,
          ],
          stops: const [0, 0.34, 1],
        ),
      ),
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.fromLTRB(
          AppSpacing.pageMargin,
          AppSpacing.lg,
          AppSpacing.pageMargin,
          AppSpacing.md,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: UserInputsScreen._contentMaxWidth,
            ),
            child: Material(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue',
                        style: textTheme.titleLarge?.copyWith(
                          color: AppColors.onPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      const Icon(
                        Icons.arrow_forward,
                        color: AppColors.onPrimary,
                        size: 28,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
