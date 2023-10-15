import 'package:dartz/dartz.dart';

import '../../../app/core/usecase/usecase.dart';
import '../../entites/order_details_entity.dart';
import '../orders_repo.dart';

class LoadReadyToDeliverUsecase extends BaseUsecase<
    Future<Either<Exception, List<OrderDetailsEntity>>>, NoParams> {
  final OrdersRepo _ordersRepo;

  LoadReadyToDeliverUsecase({required OrdersRepo ordersRepo})
      : _ordersRepo = ordersRepo;

  @override
  Future<Either<Exception, List<OrderDetailsEntity>>> call(
      NoParams params) async {
    return await _ordersRepo.loadReadyToDeliverOrders();
  }
}
