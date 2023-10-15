part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

//? get current location
final class CurrentLocationLoadingState extends HomeState {}

final class CurrentLocationSuccessState extends HomeState {}

final class CurrentLocationFailureState extends HomeState {}

//? load readyToDeliverOrders
final class ReadyToDeliverLoadingState extends HomeState {}

final class ReadyToDeliverSuccessState extends HomeState {}

final class ReadyToDeliverFailureState extends HomeState {}

//? deliver order
final class DeliverOrderLoadingState extends HomeState {}

final class DeliverOrderSuccessState extends HomeState {}

final class DeliverOrderFailureState extends HomeState {}

//? draw polyline
final class PolyLineLoadingState extends HomeState {}

final class PolyLineSuccessState extends HomeState {}

final class PolyLineFailureState extends HomeState {}
