import '../../base_response.dart';

class OrdersResponse extends BaseResponse {
  final List<Map<String, dynamic>> orders;

  OrdersResponse({
    required super.statusCode,
    required super.msg,
    required this.orders,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      statusCode: json["statusCode"],
      msg: json["msg"],
      orders: json["orders"],
    );
  }
}

class TOTOrdersResponse {
  final List<dynamic> orders;
  final int totalCount;

  TOTOrdersResponse({
    required this.totalCount,
    required this.orders,
  });

  factory TOTOrdersResponse.fromJson(Map<String, dynamic> json) {
    return TOTOrdersResponse(
      totalCount: json["totalCount"],
      orders: json["results"],
    );
  }
}
