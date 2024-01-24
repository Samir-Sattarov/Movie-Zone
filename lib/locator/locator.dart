import 'package:get_it/get_it.dart';
import 'package:movie_zone/core/api/api_client.dart';
import 'package:movie_zone/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:movie_zone/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:movie_zone/features/auth/data/repository/auth_repository_impl.dart';
import 'package:movie_zone/features/auth/domain/repository/auth_repository.dart';
import 'package:movie_zone/features/auth/domain/usecases/auth_usecases.dart';
import 'package:movie_zone/features/auth/presentation/cubit/auth/auth_cubit.dart';

import 'package:http/http.dart' as http;
import 'package:movie_zone/features/main/data/datasources/main_remote_data_source.dart';
import 'package:movie_zone/features/main/data/repository/main_repository_impl.dart';
import 'package:movie_zone/features/main/domain/repository/main_repository.dart';
import 'package:movie_zone/features/main/domain/usecases/movie_usecases.dart';
import '../core/api/firebase_api.dart';
import '../core/utils/secure_storage.dart';
import '../features/auth/domain/usecases/session_usecases.dart';
import '../features/auth/presentation/cubit/session/session_cubit.dart';
import '../features/main/domain/usecases/genres_usecase.dart';
import '../features/main/domain/usecases/tv_usecase.dart';
import '../features/main/domain/usecases/user_usecase.dart';
import '../features/main/presentation/cubit/current_user/current_user_cubit.dart';
import '../features/main/presentation/cubit/genres/genres_cubit.dart';
import '../features/main/presentation/cubit/movie_detail/movie_detail_cubit.dart';
import '../features/main/presentation/cubit/movies/movies_cubit.dart';
import '../features/main/presentation/cubit/popular_movies/popular_movies_cubit.dart';
import '../features/main/presentation/cubit/tv/tv_cubit.dart';

final locator = GetIt.I;

void setup() {
  // ================ Core ================ //

  locator.registerLazySingleton(() => SecureStorage());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<ApiClient>(
      () => ApiClientImpl(locator(), locator()));

  // ================ External ================ //

  locator.registerLazySingleton(() => FirebaseApi(locator()));

  // ================ BLoC / Cubit ================ //

  locator.registerFactory(() => AuthCubit(locator(), locator(), locator()));
  locator.registerFactory(() => SessionCubit(locator()));

  locator.registerFactory(() => MoviesCubit(locator()));
  locator.registerFactory(() => PopularMoviesCubit(locator()));
  locator.registerFactory(() => MovieDetailCubit(locator()));

  locator.registerFactory(() => CurrentUserCubit(locator(),locator()));

  locator.registerFactory(() => GenresCubit(locator()));

  locator.registerFactory(() => TvCubit(locator()));

  // ================ UseCases ================ //

  // ================ AUTH ================ //

  locator.registerLazySingleton(() => LoginUsecase(locator()));
  locator.registerLazySingleton(() => RegisterUsecase(locator()));
  locator.registerLazySingleton(() => LogOutUsecase(locator()));
  locator.registerLazySingleton(() => CheckActiveSession(locator()));

  // ================ Movie ================ //

  locator.registerLazySingleton(() => GetMoviesUsecase(locator()));
  locator.registerLazySingleton(() => GetPopularMoviesUsecase(locator()));
  locator.registerLazySingleton(() => GetMovieDetailUsecase(locator()));

  // ================ User ================ //

  locator.registerLazySingleton(() => GetCurrentUserUsecase(locator()));
  locator.registerLazySingleton(() => EditUserUsecase(locator()));

  // ================ Genre ================ //

  locator.registerLazySingleton(() => GetGenresUsecase(locator()));

  // ================ Genre ================ //

  locator.registerLazySingleton(() => GetTvUsecase(locator()));

  // ================ Repository / Datasource ================ //

  // ================ REPOSITORY ================ //

  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(locator(), locator()));

  // ================ REPOSITORY ================ //

  locator.registerLazySingleton<MainRepository>(
      () => MainRepositoryImpl(locator()));

  // ================ DATASOURCE ================ //

  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(locator()));

  locator.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(locator(), locator()));
}
