// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_architecture_project/core/di/injection_module.dart'
    as _i103;
import 'package:clean_architecture_project/core/network/network_info.dart'
    as _i54;
import 'package:clean_architecture_project/feature/number_trivia/data/data_sources/number_trivia_local_data_source.dart'
    as _i923;
import 'package:clean_architecture_project/feature/number_trivia/data/data_sources/number_trivia_remote_data_source.dart'
    as _i911;
import 'package:clean_architecture_project/feature/number_trivia/data/repositories/number_trivia_repository_impl.dart'
    as _i416;
import 'package:clean_architecture_project/feature/number_trivia/domain/repositories/number_trivia_repository.dart'
    as _i898;
import 'package:clean_architecture_project/feature/number_trivia/domain/use_cases/get_random_number_trivia.dart'
    as _i940;
import 'package:clean_architecture_project/feature/number_trivia/presentation/bloc/number_trivia_bloc.dart'
    as _i346;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i54.NetworkInfo>(
      () => _i54.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.lazySingleton<_i923.NumberTriviaLocalDataSource>(
      () => _i923.NumberTriviaLocalDataSourceImpl(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i911.NumberTriviaRemoteDataSource>(
      () => _i911.NumberTriviaRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i898.NumberTriviaRepository>(
      () => _i416.NumberTriviaRepositoryImpl(
        remoteDataSource: gh<_i911.NumberTriviaRemoteDataSource>(),
        localDataSource: gh<_i923.NumberTriviaLocalDataSource>(),
        networkInfo: gh<_i54.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i940.GetRandomNumberTrivia>(
      () => _i940.GetRandomNumberTrivia(gh<_i898.NumberTriviaRepository>()),
    );
    gh.factory<_i346.NumberTriviaBloc>(
      () => _i346.NumberTriviaBloc(
        getRandomNumberTrivia: gh<_i940.GetRandomNumberTrivia>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i103.RegisterModule {}
