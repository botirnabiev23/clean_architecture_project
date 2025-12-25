import 'package:clean_architecture_project/core/network/network_info.dart';

import 'package:clean_architecture_project/feature/number_trivia/data/data_sources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_project/feature/number_trivia/data/data_sources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_project/feature/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_project/feature/number_trivia/domain/use_cases/get_random_number_trivia.dart';
import 'package:clean_architecture_project/feature/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => NumberTriviaBloc(getRandomNumberTrivia: sl()));

  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Connectivity());
}
