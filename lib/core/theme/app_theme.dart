import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppColors {
  static const background = Color(0xfffff8fa);
  static const surface = Color(0xffffffff);
  static const surfaceDim = Color(0xffdfd8da);
  static const surfaceContainerLow = Color(0xfff9f2f4);
  static const surfaceContainer = Color(0xfff3ecee);
  static const surfaceContainerHigh = Color(0xffede6e8);
  static const primary = Color(0xff1d0b1e);
  static const primaryContainer = Color(0xff332034);
  static const primaryFixed = Color(0xfff8d9f5);
  static const primaryFixedDim = Color(0xffdbbed8);
  static const onPrimary = Color(0xffffffff);
  static const secondary = Color(0xff81515a);
  static const secondaryFixed = Color(0xffffd9df);
  static const secondaryFixedDim = Color(0xfff4b6c1);
  static const tertiaryContainer = Color(0xffd5e9c7);
  static const onTertiaryContainer = Color(0xff111f0b);
  static const onSurface = Color(0xff1d1b1c);
  static const onSurfaceVariant = Color(0xff4c454b);
  static const outline = Color(0xff7d747b);
  static const outlineVariant = Color(0xffcec3cb);
  static const error = Color(0xffba1a1a);
}

abstract final class AppSpacing {
  static const xs = 4.0;
  static const base = 8.0;
  static const sm = 12.0;
  static const md = 24.0;
  static const lg = 40.0;
  static const xl = 64.0;
  static const pageMargin = 24.0;
  static const maxContentWidth = 560.0;
}

abstract final class AppTheme {
  static ThemeData light() {
    final colorScheme =
        ColorScheme.fromSeed(
          seedColor: AppColors.primaryContainer,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          primaryContainer: AppColors.primaryContainer,
          secondary: AppColors.secondary,
          tertiaryContainer: AppColors.tertiaryContainer,
          onTertiaryContainer: AppColors.onTertiaryContainer,
          surface: AppColors.background,
          onSurface: AppColors.onSurface,
          onSurfaceVariant: AppColors.onSurfaceVariant,
          outline: AppColors.outline,
          outlineVariant: AppColors.outlineVariant,
        );

    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
    );
    final interTextTheme = GoogleFonts.interTextTheme(baseTheme.textTheme);
    final playfairTextTheme = GoogleFonts.playfairDisplayTextTheme(
      baseTheme.textTheme,
    );

    return baseTheme.copyWith(
      textTheme: interTextTheme.copyWith(
        displayLarge: playfairTextTheme.displayLarge?.copyWith(
          color: AppColors.primary,
          fontSize: 48,
          fontWeight: FontWeight.w700,
          height: 56 / 48,
        ),
        headlineMedium: playfairTextTheme.headlineMedium?.copyWith(
          color: AppColors.primary,
          fontSize: 32,
          fontWeight: FontWeight.w600,
          height: 40 / 32,
        ),
        headlineSmall: playfairTextTheme.headlineSmall?.copyWith(
          color: AppColors.primary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 32 / 24,
        ),
        titleLarge: interTextTheme.titleLarge?.copyWith(
          color: AppColors.primary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 28 / 20,
        ),
        bodyLarge: interTextTheme.bodyLarge?.copyWith(
          color: AppColors.onSurface,
          fontSize: 18,
          height: 30 / 18,
        ),
        bodyMedium: interTextTheme.bodyMedium?.copyWith(
          color: AppColors.onSurface,
          fontSize: 16,
          height: 24 / 16,
        ),
        labelMedium: interTextTheme.labelMedium?.copyWith(
          color: AppColors.onSurfaceVariant,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 20 / 14,
          letterSpacing: 0,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryContainer,
          foregroundColor: AppColors.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          minimumSize: const Size.fromHeight(52),
          textStyle: interTextTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.outlineVariant),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          minimumSize: const Size.fromHeight(52),
          textStyle: interTextTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0,
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.outlineVariant),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.outlineVariant),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
