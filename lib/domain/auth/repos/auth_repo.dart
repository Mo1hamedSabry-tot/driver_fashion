abstract class AuthRepo {
  // Future<({String? token, Exception? exception})> resetPassword(
  //     {required String email});\
  // ({String? token, Exception? exception}) getToken();
  bool isLoggedIn();
  Future<bool> login({required String email, required String password});
  Future<bool> logout();
}
