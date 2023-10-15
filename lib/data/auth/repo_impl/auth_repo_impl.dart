import '../../../app/core/utils/shared/shared.dart';
import '../../../domain/auth/repos/auth_repo.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  final Shared _appConstants;

  AuthRepoImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required AuthLocalDataSource authLocalDataSource,
    required Shared appConstants,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _authLocalDataSource = authLocalDataSource,
        _appConstants = appConstants;

  @override
  Future<bool> login({required String email, required String password}) async {
    final res = await _authRemoteDataSource.login(
      userName: email,
      password: password,
    );

    // switch (res.statusCode) {
    //   case 200:
    //     if (res.accessToken != null && res.accessToken!.isNotEmpty) {
    //       final cond =
    //           await _authLocalDataSource.saveToken(token: res.accessToken!);
    //       return cond ?? false;
    //     }
    //   default:
    //     return false;
    // }
    // return false;

    return res.fold((failure) => false, (loginResponse) async {
      final cond = await _authLocalDataSource.saveToken(
          token: loginResponse.accessToken);

      return cond ?? false;
    });
  }

  //TODO: handle the refresh token here
  @override
  bool isLoggedIn() {
    final res = _authLocalDataSource.getToken();
    // return res.token != null;
    return res.fold(
      (exception) => false,
      (accessToken) {
        _appConstants.accessToken = accessToken;
        return true;
      },
    );
  }

  @override
  Future<bool> logout() async {
    final res = _authLocalDataSource.getToken();
    return res.fold(
      (exception) => false,
      (token) async {
        final didLogout = await _authRemoteDataSource.logout(token: token);
        if (didLogout) {
          // TODO: check on the returned bool
          await _authLocalDataSource.removeToken();
          return true;
        }
        return false;
      },
    );
  }
}
