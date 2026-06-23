import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/routing/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/mock_heroine_data.dart';
import '../bloc/heroine_flow_cubit.dart';
import '../bloc/heroine_flow_state.dart';

final class HeroineCustomizationScreen extends StatelessWidget {
  const HeroineCustomizationScreen({super.key});

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
                const _StepTwoHeader(),
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
                              child: _StepTwoContent(
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
                        child: _FixedBottomGenerate(
                          onTap: state.hasValidHeroineName
                              ? () => context.go(AppRoutes.generating)
                              : null,
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

final class _StepTwoHeader extends StatelessWidget {
  const _StepTwoHeader();

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
                      onTap: () => context.go(AppRoutes.userInputs),
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
                          'Heroine Studio',
                          textAlign: TextAlign.center,
                          style: textTheme.headlineSmall?.copyWith(
                            fontSize: 20,
                            height: 26 / 20,
                          ),
                        ),
                        Text(
                          'Step 2 of 3',
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
                tween: Tween<double>(begin: 0, end: 2 / 3),
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

final class _StepTwoContent extends StatelessWidget {
  const _StepTwoContent({required this.state, required this.cubit});

  final HeroineFlowState state;
  final HeroineFlowCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _HeroinePreviewCard(state: state),
        const SizedBox(height: AppSpacing.xl),
        const _SectionLabel('Heroine Name'),
        const SizedBox(height: AppSpacing.base),
        _HeroineNameField(
          name: state.heroineName,
          showValidationError: !state.hasValidHeroineName,
          onChanged: cubit.changeHeroineName,
        ),
        const SizedBox(height: AppSpacing.xl),
        const _SectionLabel('Visual Style'),
        const SizedBox(height: AppSpacing.md),
        _VisualStyleSegmentedControl(
          selectedIndex: state.visualStyleIndex,
          onSelected: cubit.selectVisualStyle,
        ),
        const SizedBox(height: AppSpacing.xl),
        const _SectionLabel('Archetype'),
        const SizedBox(height: AppSpacing.md),
        _ArchetypeGrid(
          selectedIndex: state.archetypeIndex,
          onSelected: cubit.selectArchetype,
        ),
        const SizedBox(height: AppSpacing.xl),
        const _SectionLabel('Color Palette'),
        const SizedBox(height: AppSpacing.md),
        _PaletteSelector(
          selectedIndex: state.paletteIndex,
          onSelected: cubit.selectPalette,
        ),
        const SizedBox(height: AppSpacing.xl),
        _PersonalityHeader(selectedCount: state.selectedTraits.length),
        const SizedBox(height: AppSpacing.sm),
        _PersonalityChips(
          selectedTraits: state.selectedTraits,
          onSelected: cubit.toggleTrait,
        ),
      ],
    );
  }
}

final class _HeroinePreviewCard extends StatelessWidget {
  const _HeroinePreviewCard({required this.state});

  final HeroineFlowState state;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final title = state.trimmedHeroineName.isEmpty
        ? 'Unknown'
        : state.trimmedHeroineName;

    return Material(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColors.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base * 2,
          vertical: AppSpacing.md,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                MockHeroineAssets.heroinePreview,
                width: 88,
                height: 88,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 160),
                      layoutBuilder: (currentChild, previousChildren) {
                        return Stack(
                          alignment: Alignment.centerLeft,
                          children: [...previousChildren, ?currentChild],
                        );
                      },
                      child: Text(
                        title,
                        key: ValueKey(title),
                        maxLines: 1,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.headlineMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  SizedBox(
                    width: double.infinity,
                    height: 24,
                    child: Text(
                      _styleSubtitle(state.visualStyleIndex),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium?.copyWith(
                        color: AppColors.onSurfaceVariant,
                        height: 24 / 16,
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

final class _HeroineNameField extends StatelessWidget {
  const _HeroineNameField({
    required this.name,
    required this.showValidationError,
    required this.onChanged,
  });

  static const _maxNameLength = 24;

  final String name;
  final bool showValidationError;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return TextFormField(
      initialValue: name,
      onChanged: onChanged,
      maxLines: 1,
      maxLength: _maxNameLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      buildCounter:
          (
            context, {
            required currentLength,
            required isFocused,
            required maxLength,
          }) => null,
      textInputAction: TextInputAction.done,
      cursorColor: AppColors.primary,
      style: textTheme.bodyLarge?.copyWith(
        color: AppColors.primary,
        height: 24 / 18,
      ),
      decoration: InputDecoration(
        isDense: true,
        counterText: '',
        helperText: ' ',
        errorText: showValidationError
            ? 'Name must be at least ${HeroineFlowState.minHeroineNameLength} characters.'
            : null,
        errorMaxLines: 1,
        contentPadding: const EdgeInsets.only(bottom: AppSpacing.base),
      ),
    );
  }
}

final class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: AppColors.onSurface,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        letterSpacing: 3,
      ),
    );
  }
}

final class _VisualStyleSegmentedControl extends StatelessWidget {
  const _VisualStyleSegmentedControl({
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const inset = 4.0;
    final options = MockHeroineData.visualStyles;

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
                      border: Border.all(color: AppColors.outlineVariant),
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

final class _ArchetypeGrid extends StatelessWidget {
  const _ArchetypeGrid({required this.selectedIndex, required this.onSelected});

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSpacing.sm,
        mainAxisSpacing: AppSpacing.sm,
        childAspectRatio: 0.92,
      ),
      itemCount: MockHeroineData.archetypes.length,
      itemBuilder: (context, index) {
        return _ArchetypeCard(
          index: index,
          selected: selectedIndex == index,
          onTap: () => onSelected(index),
        );
      },
    );
  }
}

final class _ArchetypeCard extends StatelessWidget {
  const _ArchetypeCard({
    required this.index,
    required this.selected,
    required this.onTap,
  });

  final int index;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final option = MockHeroineData.archetypes[index];
    final textTheme = Theme.of(context).textTheme;
    final radius = BorderRadius.circular(10);

    return Material(
      color: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.outlineVariant,
          width: selected ? 1.6 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashColor: AppColors.primary.withValues(alpha: 0.08),
        highlightColor: AppColors.primary.withValues(alpha: 0.04),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.title,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      height: 28 / 22,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.base),
                  Text(
                    option.description,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppColors.onSurfaceVariant,
                      height: 22 / 16,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: AppSpacing.sm,
              right: AppSpacing.sm,
              child: AnimatedScale(
                scale: selected ? 1 : 0.1,
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutCubic,
                child: AnimatedOpacity(
                  opacity: selected ? 1 : 0,
                  duration: const Duration(milliseconds: 140),
                  child: const SizedBox.square(
                    dimension: 22,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: AppColors.onPrimary,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _PaletteSelector extends StatelessWidget {
  const _PaletteSelector({
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < MockHeroineData.palettes.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: _PaletteButton(
              color: MockHeroineData.palettes[i],
              selected: selectedIndex == i,
              onTap: () => onSelected(i),
            ),
          ),
      ],
    );
  }
}

final class _PaletteButton extends StatelessWidget {
  const _PaletteButton({
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);

    return AnimatedScale(
      scale: selected ? 1.08 : 1,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOutCubic,
      child: Material(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: selected ? AppColors.outline : AppColors.outlineVariant,
            width: selected ? 1.6 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          splashColor: AppColors.onPrimary.withValues(alpha: 0.10),
          highlightColor: AppColors.onPrimary.withValues(alpha: 0.05),
          child: SizedBox.square(
            dimension: 56,
            child: AnimatedOpacity(
              opacity: selected ? 1 : 0,
              duration: const Duration(milliseconds: 160),
              child: const Icon(
                Icons.check,
                color: AppColors.onPrimary,
                size: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final class _PersonalityHeader extends StatelessWidget {
  const _PersonalityHeader({required this.selectedCount});

  final int selectedCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _SectionLabel('Personality'),
        const Spacer(),
        Text(
          'Select up to 3',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }
}

final class _PersonalityChips extends StatelessWidget {
  const _PersonalityChips({
    required this.selectedTraits,
    required this.onSelected,
  });

  final List<int> selectedTraits;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        for (var i = 0; i < MockHeroineData.traits.length; i++)
          _PersonalityChip(
            label: MockHeroineData.traits[i],
            selected: selectedTraits.contains(i),
            onTap: () => onSelected(i),
          ),
      ],
    );
  }
}

final class _PersonalityChip extends StatelessWidget {
  const _PersonalityChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(18);

    return Material(
      color: selected ? AppColors.surfaceContainerLow : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.outlineVariant,
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        splashColor: AppColors.primary.withValues(alpha: 0.08),
        highlightColor: AppColors.primary.withValues(alpha: 0.04),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: selected ? AppColors.primary : AppColors.onSurfaceVariant,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
          ),
        ),
      ),
    );
  }
}

final class _FixedBottomGenerate extends StatelessWidget {
  const _FixedBottomGenerate({required this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final enabled = onTap != null;

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
              maxWidth: HeroineCustomizationScreen._contentMaxWidth,
            ),
            child: Material(
              color: enabled
                  ? AppColors.primaryContainer
                  : AppColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(10),
                splashColor: AppColors.onPrimary.withValues(alpha: 0.12),
                highlightColor: AppColors.onPrimary.withValues(alpha: 0.06),
                child: SizedBox(
                  height: 56,
                  child: Center(
                    child: Text(
                      'Generate profile',
                      style: textTheme.titleLarge?.copyWith(
                        color: enabled
                            ? AppColors.onPrimary
                            : AppColors.outline,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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

String _styleSubtitle(int index) {
  return switch (index) {
    0 => 'The Timeless Muse',
    1 => 'The Modern Mystic',
    2 => 'The Arcane Dreamer',
    3 => 'The Elegant Muse',
    _ => 'The Modern Mystic',
  };
}
