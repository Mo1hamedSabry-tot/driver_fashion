part of 'orders_bloc.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

final class OrdersInitial extends OrdersState {}

//? loading orders
final class OrdersLoadingState extends OrdersState {}

final class OrdersSuccessState extends OrdersState {}

final class OrdersFailureState extends OrdersState {}

//? order screen specific states
abstract final class LoadingState extends OrdersState {}

abstract final class SuccessState extends OrdersState {
  final String msg;

  const SuccessState({required this.msg});
}

abstract final class FailureState extends OrdersState {
  final String msg;

  const FailureState({required this.msg});
}

//* pickup order
final class PickupOrderLoadingState extends LoadingState {}

final class PickupOrderSuccessState extends SuccessState {
  const PickupOrderSuccessState()
      : super(msg: AppStrings.succeededToPickupOrder);
}

final class PickupOrderFailureState extends FailureState {
  const PickupOrderFailureState() : super(msg: AppStrings.faildedToPickupOrder);
}

//* ready to deliver
final class ReadToDeliverOrderLoadingState extends LoadingState {}

final class ReadyToDeliverOrderSuccessState extends SuccessState {
  const ReadyToDeliverOrderSuccessState()
      : super(msg: AppStrings.succeededToReadyOrder);
}

final class ReadToDeliverOrderFailureState extends FailureState {
  const ReadToDeliverOrderFailureState()
      : super(msg: AppStrings.faildedToReadyOrder);
}
