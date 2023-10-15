import 'package:equatable/equatable.dart';

class UpdateOrderParams extends Equatable {
  final String orderId;

  const UpdateOrderParams({required this.orderId});

  @override
  List<Object?> get props => [orderId];
}
