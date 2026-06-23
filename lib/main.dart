import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/heroine_studio_app.dart';
import 'core/config/env_config.dart';
import 'core/di/app_dependencies.dart';
import 'core/firebase/firebase_bootstrap.dart';
import 'core/observability/app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = AppBlocObserver();
  await EnvConfig.load();
  await initializeFirebaseApp();
  await configureDependencies();

  runApp(const HeroineStudioApp());
}
