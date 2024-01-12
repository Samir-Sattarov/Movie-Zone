import 'package:movie_zone/core/utils/secure_storage.dart';

abstract class AuthLocalDataSource {

  Future<String?> getSessionId();
  Future<void> saveSessionId(String token);

}

class AuthLocalDataSourceImpl extends AuthLocalDataSource{
  final SecureStorage secureStorage;

  AuthLocalDataSourceImpl(this.secureStorage);

  @override
  Future<String?> getSessionId()async  {
    final response = await secureStorage.get(key: "token");

    return response;
  }

  @override
  Future<void> saveSessionId(String token) async {
    await secureStorage.save(key: "token", value: token);
  }
}