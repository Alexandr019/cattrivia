import 'package:cattrivia/repo/cat_trivia_repo.dart';
import 'package:cattrivia/service/cat_trivia_service.dart';
import 'package:cattrivia/utils/constants.dart';
import 'package:cattrivia/utils/time_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

/// Dependency Injection Utils.

final getIt = GetIt.instance;

void setup() {
  getIt
    ..registerSingleton<Dio>(
      Dio(BaseOptions(
        baseUrl: baseUrl,
      )),
    )
    ..registerSingleton(CatTriviaService(
      CatTriviaRepo(getIt<Dio>(), TimeUtils()),
    )..init());
}
