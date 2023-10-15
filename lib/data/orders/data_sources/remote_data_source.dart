import 'package:dartz/dartz.dart';

import '../../../app/core/network/api/api_consumer.dart';
import '../../../app/core/network/api/end_points.dart';
import '../../../app/core/network/error/exception.dart';
import '../../../app/core/utils/shared/shared.dart';
import '../../../app/core/utils/enums/order_status_enum.dart';
import '../models/order_model.dart';
import '../responses/orders_response.dart';

abstract class OrdersRemoteDataSource {
  Future<Either<Exception, List<TOTOrderModel>>> loadOrders(
      {Map<String, dynamic> body = const {}, required OrderStatus orderStatus});
  Future<bool> changeOrderStatus({
    required String status,
    required String customerId,
    required String currency,
    required String storeId,
    required String orderId,
  });
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final ApiConsumer _apiConsumer;
  final Shared _appConstants;

  OrdersRemoteDataSourceImpl({
    required ApiConsumer apiConsumer,
    required Shared appConstants,
  })  : _apiConsumer = apiConsumer,
        _appConstants = appConstants;

  @override
  Future<Either<Exception, List<TOTOrderModel>>> loadOrders({
    Map<String, dynamic> body = const {},
    required OrderStatus orderStatus,
  }) async {
    final res = await _apiConsumer.post(
        path: EndPoints.orders,
        headers: {"Authorization": "Bearer ${_appConstants.accessToken}"},
        body: {...body, "status": orderStatus.toString()});

    return res.fold(
      (failure) {
        return const Left(ServerException());
      },
      (responseJson) {
        final ordersResponse = TOTOrdersResponse.fromJson(responseJson);
        List<TOTOrderModel> ordersModel = [];

        for (final orderJson in ordersResponse.orders) {
          final model = TOTOrderModel.fromJson(orderJson);
          // if (model.isApproved != null && model.isApproved != false) {
          ordersModel.add(model);
          // }
        }
        return Right(ordersModel);
      },
    );
  }

  @override
  Future<bool> changeOrderStatus({
    required String status,
    required String orderId,
    required String customerId,
    required String currency,
    required String storeId,
  }) async {
    final res = await _apiConsumer.put(
      headers: {"Authorization": "Bearer ${_appConstants.accessToken}"},
      path: EndPoints.updateOrder,
      body: {
        "status": status,
        "id": orderId,
        "customerId": customerId,
        "currency": currency,
        "storeId": storeId
      },
    );

    return res.fold(
      (serverException) => false,
      (success) => true,
    );
  }
}
