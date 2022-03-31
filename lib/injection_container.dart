import 'package:flutter_test_drive/number_trivia/core/NetworkProvider.dart';
import 'package:flutter_test_drive/number_trivia/core/platform/network_info.dart';
import 'package:flutter_test_drive/number_trivia/core/util/input_converter.dart';
import 'package:flutter_test_drive/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_test_drive/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_test_drive/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_test_drive/number_trivia/domain/repositories/nuber_trivia_repository.dart';
import 'package:flutter_test_drive/number_trivia/domain/usecases/get_number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_test_drive/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
final sl = GetIt.instance;

void init() async {
  sl.registerFactory(() => NumberTriviaBloc(
      getNumberTrivia: sl(),
      getRandomNumberTrivia: sl(),
      inputConverter: sl()));
  sl.registerLazySingleton(() => GetNumberTrivia(repository: sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(repository: sl()));

  sl.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(networkProvider: sl()),
  );

  sl.registerLazySingleton(()=> NetworkProvider(httpClient: sl()));

  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(sl()),
  );
//! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());

}
