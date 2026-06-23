import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/heroine/presentation/screens/generation_loading_screen.dart';
import '../../features/heroine/presentation/screens/heroine_customization_screen.dart';
import '../../features/heroine/presentation/screens/heroine_result_screen.dart';
import '../../features/heroine/presentation/screens/saved_confirmation_screen.dart';
import '../../features/heroine/presentation/screens/saved_heroine_detail_screen.dart';
import '../../features/heroine/presentation/screens/start_screen.dart';
import '../../features/heroine/presentation/screens/user_inputs_screen.dart';

abstract final class AppRoutes {
  static const start = '/';
  static const userInputs = '/personalize';
  static const customization = '/customize';
  static const generating = '/generating';
  static const result = '/result';
  static const saved = '/saved';
  static const detail = '/saved/detail';
}

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.start,
      pageBuilder: (context, state) => _buildPage(state, const StartScreen()),
    ),
    GoRoute(
      path: AppRoutes.userInputs,
      pageBuilder: (context, state) =>
          _buildPage(state, const UserInputsScreen()),
    ),
    GoRoute(
      path: AppRoutes.customization,
      pageBuilder: (context, state) =>
          _buildPage(state, const HeroineCustomizationScreen()),
    ),
    GoRoute(
      path: AppRoutes.generating,
      pageBuilder: (context, state) =>
          _buildPage(state, const GenerationLoadingScreen()),
    ),
    GoRoute(
      path: AppRoutes.result,
      pageBuilder: (context, state) =>
          _buildPage(state, const HeroineResultScreen()),
    ),
    GoRoute(
      path: AppRoutes.saved,
      pageBuilder: (context, state) =>
          _buildPage(state, const SavedConfirmationScreen()),
    ),
    GoRoute(
      path: AppRoutes.detail,
      pageBuilder: (context, state) =>
          _buildPage(state, const SavedHeroineDetailScreen()),
    ),
  ],
);

CustomTransitionPage<void> _buildPage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 360),
    reverseTransitionDuration: const Duration(milliseconds: 240),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
        reverseCurve: Curves.easeInCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.035, 0),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
  );
}
