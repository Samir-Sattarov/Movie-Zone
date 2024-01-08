import 'package:get_it/get_it.dart';
import 'package:movie_zone/features/auth/presentation/cubit/auth/auth_cubit.dart';

import '../core/api/firebase_api.dart';
import '../core/utils/secure_storage.dart';

final locator = GetIt.I;

void setup() {

  // ================ Core ================ //

  locator.registerLazySingleton(() => SecureStorage());

  // ================ External ================ //

  locator.registerLazySingleton(() => FirebaseApi(locator()));

  // ================ BLoC / Cubit ================ //
  locator.registerFactory(() => AuthCubit(locator()));

  // ================ UseCases ================ //

  // ================ Repository / Datasource ================ //






}
