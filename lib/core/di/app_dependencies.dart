import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

import '../config/env_config.dart';
import '../../features/heroine/data/firebase_heroine_story_generator.dart';
import '../../features/heroine/data/heroine_repository_impl.dart';
import '../../features/heroine/data/local/heroine_database.dart';
import '../../features/heroine/domain/heroine_repository.dart';
import '../../features/heroine/domain/heroine_story_generator.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> configureDependencies() async {
  if (!serviceLocator.isRegistered<FirebaseAuth>()) {
    serviceLocator.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance,
    );
  }
  if (!serviceLocator.isRegistered<FirebaseFirestore>()) {
    serviceLocator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
  }
  if (!serviceLocator.isRegistered<FirebaseDatabase>()) {
    serviceLocator.registerLazySingleton<FirebaseDatabase>(
      () => FirebaseDatabase.instance,
    );
  }
  if (!serviceLocator.isRegistered<FirebaseAI>()) {
    serviceLocator.registerLazySingleton<FirebaseAI>(FirebaseAI.googleAI);
  }
  if (!serviceLocator.isRegistered<GenerativeModel>()) {
    serviceLocator.registerLazySingleton<GenerativeModel>(
      () => serviceLocator<FirebaseAI>().generativeModel(
        model: EnvConfig.requiredString('FIREBASE_AI_MODEL'),
      ),
    );
  }
  if (!serviceLocator.isRegistered<HeroineStoryGenerator>()) {
    serviceLocator.registerLazySingleton<HeroineStoryGenerator>(
      () => FirebaseHeroineStoryGenerator(
        model: serviceLocator<GenerativeModel>(),
        firebaseAuth: serviceLocator<FirebaseAuth>(),
      ),
    );
  }
  if (!serviceLocator.isRegistered<HeroineDatabase>()) {
    serviceLocator.registerLazySingleton<HeroineDatabase>(
      HeroineDatabase.open,
      dispose: (database) => database.close(),
    );
  }
  if (!serviceLocator.isRegistered<HeroineRepository>()) {
    serviceLocator.registerLazySingleton<HeroineRepository>(
      () => HybridHeroineRepository(
        database: serviceLocator<HeroineDatabase>(),
        firebaseAuth: serviceLocator<FirebaseAuth>(),
        firestore: serviceLocator<FirebaseFirestore>(),
      ),
    );
  }

  await serviceLocator.allReady();
}
