class BaseResponse {
  final int statusCode;
  final String? msg;

  BaseResponse({required this.statusCode, required this.msg});

  factory BaseResponse.fromJson({required Map<String, dynamic> json}) {
    return BaseResponse(
      statusCode: json["status_code"],
      msg: json["msg"],
    );
  }
}
