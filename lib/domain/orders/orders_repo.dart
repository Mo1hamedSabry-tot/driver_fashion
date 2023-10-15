import 'package:dartz/dartz.dart';
import 'package:test_project/domain/entites/order_details_entity.dart';

abstract class OrdersRepo {
  Future<
      Either<
          Exception,
          ({
            List<OrderDetailsEntity> availableOrders,
            List<OrderDetailsEntity> pickedOrders
          })>> loadOrders();
  Future<bool> pickupOrder({required String orderId});
  Future<bool> readyToDeliverOrder({required String orderId});
  Future<Either<Exception, List<OrderDetailsEntity>>>
      loadReadyToDeliverOrders();
  Future<bool> completeDelivery({required String orderId});
}
