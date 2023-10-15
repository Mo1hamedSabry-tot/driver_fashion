import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app/config/routing_helper.dart';

import '../../app/components/elements/shimmer.dart';
import '../../app/components/templates/deliveries_template.dart';
import '../../app/components/organisms/orders_or_empty_organism.dart';
import '../../app/config/routes.dart';
import '../../app/core/utils/helpers/helpers.dart';
import '../../app/core/utils/value_managers/app_constants.dart';
import '../../app/core/utils/value_managers/app_strings.dart';
import '../home/bloc/home_bloc.dart';
import 'bloc/orders_bloc.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is ReadyToDeliverSuccessState) {
          if (context.mounted) {
            navigateNamedAndRemoveAll(context, route: Routes.homeRoute);
          }
        }
      },
      child: BlocConsumer<OrdersBloc, OrdersState>(
        listener: (BuildContext context, OrdersState state) async {
          if (state is LoadingState) {
            Navigator.pop(context);
          }
          if (state is SuccessState) {
            // Navigator.pop(context);
            context.read<OrdersBloc>().add(LoadOrdersEvent());
            //? to fetch readyToDeliver orders
            // if (state is ReadyToDeliverSuccessState)
            // TODO: handle this
            if (state.msg == AppStrings.succeededToReadyOrder) {
              context.read<HomeBloc>().add(LoadReadyToDeliverEvent());
            }
            AppHelpers.displaySnackBar(context, state.msg);
          }
          if (state is FailureState) {
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   _overlayEntry.remove();
            // });
            await AppHelpers.showToast(message: state.msg);
          }
        },
        builder: (context, state) {
          final watch = context.watch<OrdersBloc>();
          return CustomShimmer(
            linearGradient: AppConstants.shimmerGradient,
            isLoading: state is LoadingState,
            child: DeliveriesTemplate(
              count: watch.totalOrders,
              title: AppStrings.ordersTitle,
              activeTitle: AppStrings.pickedOrders,
              availableTitle: AppStrings.availableOrders,
              activeWidget: OrdersOrEmptyOrganism(
                orders: watch.pickedOrders,
                // changeOrderStatusCallback: () {
                //         context
                //             .read<OrdersBloc>()
                //             .add(PickupAOrdersEvent(orderId: order.id));
                //       },
                changeOrderStatusEvent: ChangeOrderStatusEvents.readyToDeliver,
              ),
              availableWidget: OrdersOrEmptyOrganism(
                orders: watch.availableOrders,
                changeOrderStatusEvent: ChangeOrderStatusEvents.pickup,
              ),
            ),
          );
        },
      ),
    );
  }
}
