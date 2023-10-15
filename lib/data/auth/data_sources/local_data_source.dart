import 'package:dartz/dartz.dart';
import 'package:test_project/data/external_dependencies/shared_prefs.dart';

import '../../../app/core/network/error/exception.dart';

abstract class AuthLocalDataSource {
  Future<bool?> saveToken({required String token});
  Either<Exception, String> getToken();
  Future<bool> removeToken();
}

const _accessToken = "access_token";

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPrefs _sharedPrefs;

  AuthLocalDataSourceImpl({required SharedPrefs prefs}) : _sharedPrefs = prefs;
  @override
  Future<bool?> saveToken({required String token}) async {
    return await _sharedPrefs.saveString(key: _accessToken, value: token);
  }

  @override
  Either<Exception, String> getToken() {
    final res = _sharedPrefs.get<String>(key: _accessToken);

    return (res != null)
        ? Right(res) //(token: res, exception: null)
        : Left(CacheException()); //(token: null, exception: CacheException());
  }

  @override
  Future<bool> removeToken() async {
    return await _sharedPrefs.remove(key: _accessToken);
  }
}
