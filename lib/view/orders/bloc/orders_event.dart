part of 'orders_bloc.dart';

sealed class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

final class LoadOrdersEvent extends OrdersEvent {}

/// change order status events
///
enum ChangeOrderStatusEvents {
  pickup,
  readyToDeliver;

  ChangeOrderStatusEvent getEvent({required String id}) {
    return switch (this) {
      ChangeOrderStatusEvents.pickup => PickupOrderEvent(orderId: id),
      ChangeOrderStatusEvents.readyToDeliver =>
        ReadyToDeliverEvent(orderId: id),
    };
  }

  @override
  String toString() {
    return switch (this) {
      ChangeOrderStatusEvents.pickup => "PickUp Order",
      ChangeOrderStatusEvents.readyToDeliver => "Ready To Deliver",
    };
  }
}

sealed class ChangeOrderStatusEvent extends OrdersEvent {
  final String orderId;

  const ChangeOrderStatusEvent({required this.orderId});

  @override
  List<Object> get props => [orderId];
}

final class PickupOrderEvent extends ChangeOrderStatusEvent {
  const PickupOrderEvent({required super.orderId});
}

final class ReadyToDeliverEvent extends ChangeOrderStatusEvent {
  const ReadyToDeliverEvent({required super.orderId});
}
