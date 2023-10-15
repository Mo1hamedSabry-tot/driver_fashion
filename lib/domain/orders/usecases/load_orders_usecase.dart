import 'package:dartz/dartz.dart';

import '../../../app/core/usecase/usecase.dart';
import '../../entites/order_details_entity.dart';
import '../orders_repo.dart';

class LoadOrdersUsecase extends BaseUsecase<
    Future<
        Either<
            Exception,
            ({
              List<OrderDetailsEntity> availableOrders,
              List<OrderDetailsEntity> pickedOrders
            })>>,
    NoParams> {
  final OrdersRepo _ordersRepo;

  LoadOrdersUsecase({required OrdersRepo ordersRepo})
      : _ordersRepo = ordersRepo;

  @override
  Future<
      Either<
          Exception,
          ({
            List<OrderDetailsEntity> availableOrders,
            List<OrderDetailsEntity> pickedOrders
          })>> call(NoParams params) async {
    return await _ordersRepo.loadOrders();
  }
}
