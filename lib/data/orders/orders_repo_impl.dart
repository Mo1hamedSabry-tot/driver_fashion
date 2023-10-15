import 'package:dartz/dartz.dart';
import 'package:test_project/app/core/network/error/failure.dart';
import 'package:test_project/data/orders/mappers/order_mapper.dart';

import '../../app/core/utils/enums/order_status_enum.dart';
import '../../domain/entites/order_details_entity.dart';
import '../../domain/orders/orders_repo.dart';
import 'data_sources/remote_data_source.dart';
import 'models/order_model.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersRemoteDataSource _remoteDataSource;
  List<TOTOrderModel> _availableOrders = [];
  List<TOTOrderModel> _pickedOrders = [];
  List<TOTOrderModel> _readyToDeliverOrderModels = [];

  OrdersRepoImpl({required OrdersRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<
      Either<
          Exception,
          ({
            List<OrderDetailsEntity> availableOrders,
            List<OrderDetailsEntity> pickedOrders
          })>> loadOrders() async {
    final availableRes =
        await _remoteDataSource.loadOrders(orderStatus: OrderStatus.available);
    //? available orders
    availableRes.fold((exception) {
      return Left(exception);
    }, (orderModels) {
      _availableOrders = orderModels;
    });
    //? picked orders
    final pickedRes =
        await _remoteDataSource.loadOrders(orderStatus: OrderStatus.picked);
    pickedRes.fold((exception) {
      return Left(exception);
    }, (orderModels) {
      _pickedOrders = orderModels;
    });

    return Right((
      pickedOrders: _pickedOrders.map((e) => e.toDomain()).toList(),
      availableOrders: _availableOrders.map((e) => e.toDomain()).toList()
    ));
  }

  @override
  Future<Either<Exception, List<OrderDetailsEntity>>>
      loadReadyToDeliverOrders() async {
    final res = await _remoteDataSource.loadOrders(
        orderStatus: OrderStatus.readyToDeliver);

    return res.fold(
      (exception) => Left(exception),
      (orders) {
        _readyToDeliverOrderModels = orders;

        final entities = orders.map((e) => e.toDomain()).toList();

        return Right(entities);
      },
    );
  }

  @override
  Future<bool> pickupOrder({required String orderId}) async {
    final model =
        _availableOrders.singleWhere((element) => element.id == orderId);

    return await _remoteDataSource.changeOrderStatus(
      status: OrderStatus.picked.toString(),
      orderId: orderId,
      customerId: model.customerId!,
      currency: model.currency ?? 'EGP',
      storeId: model.storeId!,
    );
  }

  @override
  Future<bool> readyToDeliverOrder({required String orderId}) async {
    final model = _pickedOrders.singleWhere((element) => element.id == orderId);

    return await _remoteDataSource.changeOrderStatus(
      status: OrderStatus.readyToDeliver.toString(),
      orderId: orderId,
      customerId: model.customerId!,
      currency: model.currency ?? 'EGP',
      storeId: model.storeId!,
    );
  }

  @override
  Future<bool> completeDelivery({required String orderId}) async {
    final model = _readyToDeliverOrderModels
        .singleWhere((element) => element.id == orderId);

    final res = await _remoteDataSource.changeOrderStatus(
        status: OrderStatus.completed.toString(),
        customerId: model.customerId ?? "",
        currency: model.currency ?? "EGP",
        storeId: model.storeId ?? "",
        orderId: orderId);

    return res;
  }
}
