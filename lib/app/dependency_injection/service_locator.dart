import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/datasources/generate_hashtags_datasource.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/datasources/generate_hashtags_datasource_impl.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/data/repositories/generate_hashtags_repository_impl.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/repositories/generate_hashtags_repository.dart';
import 'package:english_football_hashtag_generator/modules/generate_hashtags/domain/usecases/generate_hashtags_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initializeServiceLocator() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initExternalDependencies();
  _initCore();
  _initDataSources();
  _initRepositories();
  _initFeatures();
}

Future<void> _initExternalDependencies() async {}

void _initCore() {}

void _initDataSources() {
  serviceLocator.registerLazySingleton<GenerateHashtagsLocalDatasource>(() =>
      GenerateHashtagsLocalDatasourceImpl(
          databasePath: 'lib/core/data/database.json'));
}

void _initRepositories() {
  serviceLocator.registerLazySingleton<GenerateHashTagsRepository>(
      () => GenerateHashtagsRepositoryImpl(dataSource: serviceLocator()));
}

void _initFeatures() {
  serviceLocator.registerLazySingleton<GenerateHashTagUseCase>(
      () => GenerateHashTagUseCase(repository: serviceLocator()));
}
