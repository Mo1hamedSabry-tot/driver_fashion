import 'package:flutter/material.dart';
import 'package:test_project/view/home/home_screen.dart';
import 'package:test_project/view/orders/orders_screen.dart';
import 'package:test_project/view/parcel_history/parcel_history_screen.dart';
import 'package:test_project/view/parcels/parcels_screen.dart';
import 'package:test_project/view/splash/splash_screen.dart';

import '../../view/income/income_screen.dart';
import '../../view/login/login_screen.dart';
import '../../view/order_history/orders_history_screen.dart';
import '../../view/profile/profile_screen.dart';
import '../core/utils/value_managers/app_strings.dart';

abstract class Routes {
  static const splashRoute = '/splashRoute';
  static const loginRoute = "/loginRoute";
  static const homeRoute = '/homeRoute';
  static const profileRoute = '/profileRoute';
  static const incomeRoute = '/incomeRoute';
  static const parcelsHistoryRoute = '/parcelsHistoryRoute';
  static const ordersHistoryRoute = '/ordersHistoryRoute';
  static const parcelsRoute = '/parcelsRoute';
  static const ordersRoute = '/ordersRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.incomeRoute:
        return MaterialPageRoute(builder: (_) => const IncomeScreen());
      case Routes.parcelsHistoryRoute:
        return MaterialPageRoute(builder: (_) => const ParcelsHistoryScreen());
      case Routes.ordersHistoryRoute:
        return MaterialPageRoute(builder: (_) => const OrdersHistoryScreen());
      case Routes.parcelsRoute:
        return MaterialPageRoute(builder: (_) => const ParcelsScreen());
      case Routes.ordersRoute:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.undefinedRoute)),
        body: const Center(child: Text(AppStrings.undefinedRoute)),
      ),
    );
  }
}
