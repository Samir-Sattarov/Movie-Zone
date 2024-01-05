import 'package:get_it/get_it.dart';

import '../core/api/firebase_api.dart';
import '../core/utils/secure_storage.dart';

final locator = GetIt.I;

void setup() {
  // ================ BLoC / Cubit ================ //

  // ================ UseCases ================ //

  // ================ Repository / Datasource ================ //

  // ================ Core ================ //

  locator.registerLazySingleton(() => SecureStorage());

  // ================ External ================ //

  locator.registerSingleton(() => FirebaseApi(locator()));

}
