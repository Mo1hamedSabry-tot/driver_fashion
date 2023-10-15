import 'package:test_project/data/base_response.dart';

class ProfileDataResponse extends BaseResponse {
  final Map<String, dynamic>? userData;
  final Map<String, dynamic>? accountStats;

  ProfileDataResponse(
      {this.userData, this.accountStats, required super.statusCode, super.msg});

  factory ProfileDataResponse.fromJson({required Map<String, dynamic> json}) {
    return ProfileDataResponse(
      statusCode: json["status_code"],
      msg: json["msg"],
      userData: json["user_data"],
      accountStats: json["account_stats"],
    );
  }
}
