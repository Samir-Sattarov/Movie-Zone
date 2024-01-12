import 'package:get_it/get_it.dart';
import 'package:movie_zone/core/api/api_client.dart';
import 'package:movie_zone/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:movie_zone/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:movie_zone/features/auth/data/repository/auth_repository_impl.dart';
import 'package:movie_zone/features/auth/domain/repository/auth_repository.dart';
import 'package:movie_zone/features/auth/domain/usecases/auth_usecases.dart';
import 'package:movie_zone/features/auth/presentation/cubit/auth/auth_cubit.dart';


import 'package:http/http.dart' as http;
import '../core/api/firebase_api.dart';
import '../core/utils/secure_storage.dart';

final locator = GetIt.I;

void setup() {

  // ================ Core ================ //

  locator.registerLazySingleton(() => SecureStorage());
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<ApiClient>(() => ApiClientImpl(locator(), locator()));

  // ================ External ================ //

  locator.registerLazySingleton(() => FirebaseApi(locator()));

  // ================ BLoC / Cubit ================ //
  locator.registerFactory(() => AuthCubit(locator(),locator()));

  // ================ UseCases ================ //


  // ================ AUTH ================ //

  locator.registerLazySingleton(() => LoginUsecase(locator()));
  locator.registerLazySingleton(() => RegisterUsecase(locator()));




  // ================ Repository / Datasource ================ //


  // ================ REPOSITORY ================ //

  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(locator(), locator()));


  // ================ DATASOURCE ================ //

  locator.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(locator()));


}
