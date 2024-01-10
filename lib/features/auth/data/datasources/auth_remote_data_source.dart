import '../../../../core/api/firebase_api.dart';

abstract class AuthRemoteDataSource {
  Future<bool> signIn({
    required String email,
    required String password,
  });
  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
  });
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseApi firebaseApi;

  AuthRemoteDataSourceImpl(this.firebaseApi);

  @override
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {

    await firebaseApi.signIn(email: email, password: password);
    return true;
  }

  @override
  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
     await firebaseApi.signUp(
      email: email,
      password: password,
      name: name,
    );

    return true;

  }
}
