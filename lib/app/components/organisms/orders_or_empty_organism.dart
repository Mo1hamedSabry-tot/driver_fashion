import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view/orders/bloc/orders_bloc.dart';
import 'empty_organism.dart';
import '../../../domain/entites/order_details_entity.dart';
import '../../../view/orders/widgets/organisms/order_card.dart';

class OrdersOrEmptyOrganism extends StatelessWidget {
  final List<OrderDetailsEntity> orders;
  final bool isntHistory;
  // final VoidCallback changeOrderStatusCallback;
  final ChangeOrderStatusEvents changeOrderStatusEvent;

  const OrdersOrEmptyOrganism({
    super.key,
    required this.orders,
    this.isntHistory = true,
    // required this.changeOrderStatusCallback,
    required this.changeOrderStatusEvent,
  });

  @override
  Widget build(BuildContext context) {
    return (orders.isNotEmpty)
        ? Padding(
            padding: REdgeInsets.symmetric(vertical: 20),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return OrderCard(
                  orderModel: order,
                  isntHistory: isntHistory,
                  orderNextStatus: changeOrderStatusEvent.toString(),
                  changeOrderStatusCallback: () {
                    context
                        .read<OrdersBloc>()
                        // .add(PickupOrderEvent(orderId: order.id));
                        .add(changeOrderStatusEvent.getEvent(id: order.id));
                  },
                );
              },
            ),
          )
        : const EmptyOrganism();
  }
}
