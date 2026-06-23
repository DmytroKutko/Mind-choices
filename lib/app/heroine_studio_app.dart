import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/di/app_dependencies.dart';
import '../core/theme/app_theme.dart';
import '../features/heroine/presentation/bloc/heroine_flow_cubit.dart';
import '../features/heroine/domain/heroine_repository.dart';
import '../features/heroine/domain/heroine_story_generator.dart';
import 'routing/app_router.dart';

final class HeroineStudioApp extends StatelessWidget {
  const HeroineStudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HeroineFlowCubit(
        repository: serviceLocator<HeroineRepository>(),
        storyGenerator: serviceLocator<HeroineStoryGenerator>(),
      ),
      child: MaterialApp.router(
        title: 'Heroine Studio',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        routerConfig: appRouter,
      ),
    );
  }
}
