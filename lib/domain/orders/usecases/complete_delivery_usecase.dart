import '../../../app/core/usecase/usecase.dart';
import '../orders_repo.dart';
import 'shared_params/update_order_params.dart';

class CompleteDeliveryUsecase
    extends BaseUsecase<Future<bool>, UpdateOrderParams> {
  final OrdersRepo _ordersRepo;

  CompleteDeliveryUsecase({required OrdersRepo ordersRepo})
      : _ordersRepo = ordersRepo;

  @override
  Future<bool> call(UpdateOrderParams params) async {
    return await _ordersRepo.completeDelivery(orderId: params.orderId);
  }
}
