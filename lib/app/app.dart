import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../injection_container.dart';
import '../view/home/bloc/home_bloc.dart';
import '../view/login/bloc/login_bloc.dart';
import '../view/orders/bloc/orders_bloc.dart';
import '../view/profile/bloc/profile_bloc.dart';
import '../view/splash/bloc/splash_bloc.dart';
import '../view/stories/bloc/stories_bloc.dart';
import 'config/routes.dart';
import 'core/utils/value_managers/app_strings.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<SplashBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<LoginBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<HomeBloc>()..add(LoadReadyToDeliverEvent()),
          ),
          BlocProvider(
            create: (context) => sl<OrdersBloc>()..add(LoadOrdersEvent()),
          ),
          BlocProvider(
            create: (context) => sl<StoriesBloc>()..add(GetStoriesEvent()),
          ),
          BlocProvider(
            create: (context) => sl<ProfileBloc>()..add(LoadProfileDataEvent()),
          ),
        ],
        child: const MaterialApp(
          title: AppStrings.appTitle,
          onGenerateRoute: RouteGenerator.getRoute,
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashRoute,
        ),
      ),
    );
  }
}
