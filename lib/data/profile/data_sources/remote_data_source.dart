import 'package:dartz/dartz.dart';

import '../../../app/core/network/api/api_consumer.dart';
import '../../../app/core/network/api/end_points.dart';
import '../../../app/core/network/error/failure.dart';
import '../../../app/core/utils/shared/shared.dart';
import '../models/dummy_models/account_stats.dart';
import '../models/user_data_model.dart';

abstract class ProfileRemoteDataSource {
  Future<
          Either<Failure,
              ({AccountStatsModel accountStatsModel, UserDataModel userModel})>>
      getProfileData();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Shared _appConstants;
  final ApiConsumer _apiConsumer;

  ProfileRemoteDataSourceImpl({
    required Shared appConstants,
    required ApiConsumer apiConsumer,
  })  : _appConstants = appConstants,
        _apiConsumer = apiConsumer;
  @override
  Future<
          Either<Failure,
              ({AccountStatsModel accountStatsModel, UserDataModel userModel})>>
      getProfileData() async {
    final token = _appConstants.accessToken;

    if (token.isEmpty) left(CacheFailure());

    //? getting the userID
    final res = await _apiConsumer.get(
        path: EndPoints.currentUserID,
        headers: {"Authorization": "Bearer $token"});

    return res.fold(
      (serverException) => Left(ServerFailure()),
      (data) async {
        final String id = data["id"] ?? "";

        if (id.isEmpty) {
          return Left(ServerFailure());
        } else {
          final res = await _apiConsumer.get(
            path: "${EndPoints.userDetails}/$id",
            headers: {"Authorization": "Bearer $token"},
          );

          return res.fold(
            (serverException) => Left(ServerFailure()),
            (data) {
              try {
                final userModel = UserDataModel.fromJson(data);

                return Right((
                  accountStatsModel: AccountStatsModel.fromJson(
                      json: successJson["account_stats"]!
                          as Map<String, dynamic>),
                  userModel: userModel
                ));
              } catch (error) {
                return Left(ServerFailure());
              }
            },
          );
        }
      },
    );
  }
}

final successJson = {
  "status_code": 200,
  "msg": "Success",
  "user_data": {
    "name": "Deliveryboy",
    "id": "12023400022",
    "img_url":
        "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5b9e10cb-f8ad-4f46-ac1a-241c7500eca6/dar48un-ffdb15c3-6576-4ee0-b945-d14867932194.jpg/v1/fill/w_1024,h_641,q_75,strp/chaotic__maxxor_by_dinamixmax_dar48un-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NjQxIiwicGF0aCI6IlwvZlwvNWI5ZTEwY2ItZjhhZC00ZjQ2LWFjMWEtMjQxYzc1MDBlY2E2XC9kYXI0OHVuLWZmZGIxNWMzLTY1NzYtNGVlMC1iOTQ1LWQxNDg2NzkzMjE5NC5qcGciLCJ3aWR0aCI6Ijw9MTAyNCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.m3B7ji0CyQPG3ZrdMDY_ziHQlU8eF-mzCvArBUPreCY",
    "rating": 3.601,
    "phone_number": "12023400022",
  },
  "account_stats": {
    "balance": "1.0e+219",
    "last_profit": 25000000.0,
    "delivered_orders": 140,
  },
};
