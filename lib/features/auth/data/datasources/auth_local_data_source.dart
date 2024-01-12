 abstract class AuthLocalDataSource {

   Future<String?> getSessionId();
 }
 class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  @override
  Future<String?> getSessionId() {
    // TODO: implement getSessionId
    throw UnimplementedError();
  }
}