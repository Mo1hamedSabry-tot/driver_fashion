import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../app/core/network/api/api_consumer.dart';
import '../../../app/core/network/api/end_points.dart';
import '../../../app/core/network/error/failure.dart';
import '../responses/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, LoginResponse>> login(
      {required String userName, required String password});
  Future<bool> logout({required String token});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiConsumer _apiConsumer;

  AuthRemoteDataSourceImpl({required ApiConsumer apiConsumer})
      : _apiConsumer = apiConsumer;

  @override
  Future<Either<Failure, LoginResponse>> login(
      {required String userName, required String password}) async {
    // if (email == "delivery@github.com" && password == "delivery") {
    //   return LoginResponse.fromJson(json: successJson);
    // } else {
    //   return LoginResponse.fromJson(json: failureJson);
    // }
    final res = await _apiConsumer.post(
        path: EndPoints.login,
        contentType: Headers.formUrlEncodedContentType,
        body: {
          "grant_type": "password",
          "username": userName,
          "password": password,
        });

    return res.fold(
      (serverException) => Left(ServerFailure()),
      (bodyJson) {
        try {
          return Right(LoginResponse.fromJson(json: bodyJson));
        } catch (e) {
          return Left(ServerFailure());
        }
      },
    );
  }

  @override
  Future<bool> logout({required String token}) async {
    final res = await _apiConsumer.get(
        path: EndPoints.logout, headers: {"Authorization": "Bearer $token"});

    return res.fold(
      (serverException) => false,
      (success) => true,
    );
  }
}

// final successJson = {
//   "status_code": 200,
//   "msg": "Success",
//   "token": "token",
// };
// final failureJson = {
//   "status_code": 400,
//   "msg": "Failure",
// };
