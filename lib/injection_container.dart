import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/domain/home/usecases/get_polyline_usecase.dart';

import 'app/core/network/api/api_consumer.dart';
import 'app/core/network/api/app_interceptors.dart';
import 'app/core/network/api/dio_consumer.dart';
import 'app/core/utils/shared/shared.dart';
import 'data/auth/data_sources/local_data_source.dart';
import 'data/auth/data_sources/remote_data_source.dart';
import 'data/auth/repo_impl/auth_repo_impl.dart';
import 'data/external_dependencies/shared_prefs.dart';
import 'data/home/data_sources/map/local_data_source.dart';
import 'data/home/data_sources/map/remote_data_source.dart';
import 'data/home/repos/map_repo_impl.dart';
import 'data/orders/data_sources/remote_data_source.dart';
import 'data/orders/orders_repo_impl.dart';
import 'data/profile/data_sources/remote_data_source.dart';
import 'data/profile/repo/profile_repo_impl.dart';
import 'data/stories/data_sources/remote_data_source.dart';
import 'data/stories/repo/stories_repo_impl.dart';
import 'domain/auth/repos/auth_repo.dart';
import 'domain/auth/usecases/is_logged_usecase.dart';
import 'domain/auth/usecases/login_usecase.dart';
import 'domain/auth/usecases/logout_usecase.dart';
import 'domain/home/repos/map_repo.dart';
import 'domain/home/usecases/get_current_location_usecase.dart';
import 'domain/orders/orders_repo.dart';
import 'domain/orders/usecases/complete_delivery_usecase.dart';
import 'domain/orders/usecases/load_orders_usecase.dart';
import 'domain/orders/usecases/load_ready_to_deliver_orders_usecase.dart';
import 'domain/orders/usecases/pickup_order_usecase.dart';
import 'domain/orders/usecases/ready_to_deliver_usecase.dart';
import 'domain/profile/repo/profile_repo.dart';
import 'domain/profile/usecases/load_profile_usecase.dart';
import 'domain/stories/repos/stories_repo.dart';
import 'view/home/bloc/home_bloc.dart';
import 'view/login/bloc/login_bloc.dart';
import 'view/orders/bloc/orders_bloc.dart';
import 'view/profile/bloc/profile_bloc.dart';
import 'view/splash/bloc/splash_bloc.dart';
import 'view/stories/bloc/stories_bloc.dart';

final sl = GetIt.instance;

Future init() async {
  //? blocs
  sl.registerLazySingleton<SplashBloc>(() => SplashBloc(isLoggedUsecase: sl()));
  sl.registerLazySingleton<HomeBloc>(() => HomeBloc(
        getCurrentLocation: sl(),
        loadReadyToDeliverUsecase: sl(),
        completDeliveryUsecase: sl(),
        drawPolylineUsecase: sl(),
      ));
  sl.registerLazySingleton<LoginBloc>(() => LoginBloc(loginUsecase: sl()));
  sl.registerLazySingleton<OrdersBloc>(() => OrdersBloc(
      loadActiveOrdersUsecase: sl(),
      updateOrderUsecase: sl(),
      readyToDeliverUsecase: sl()));
  sl.registerLazySingleton<ProfileBloc>(() => ProfileBloc(
        loadProfileDataUsecase: sl(),
        logoutUsecase: sl(),
      ));
  sl.registerLazySingleton<StoriesBloc>(() => StoriesBloc(storiesRepo: sl()));

  //? usecases
  //* splash
  sl.registerLazySingleton<IsLoggedUsecase>(
      () => IsLoggedUsecase(authRepo: sl()));
  //* home
  sl.registerLazySingleton<GetCurrentLocationUsecase>(
      () => GetCurrentLocationUsecase(mapRepo: sl()));
  sl.registerLazySingleton<LoadReadyToDeliverUsecase>(
      () => LoadReadyToDeliverUsecase(ordersRepo: sl()));
  sl.registerLazySingleton<CompleteDeliveryUsecase>(
      () => CompleteDeliveryUsecase(ordersRepo: sl()));
  sl.registerLazySingleton<DrawPolylineUsecase>(
      () => DrawPolylineUsecase(mapRepo: sl()));
  //* login
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(authRepo: sl()));
  //* orders
  sl.registerLazySingleton<LoadOrdersUsecase>(
      () => LoadOrdersUsecase(ordersRepo: sl()));
  sl.registerLazySingleton<PickupOrderUsecase>(
      () => PickupOrderUsecase(ordersRepo: sl()));
  sl.registerLazySingleton<ReadyToDeliverUsecase>(
      () => ReadyToDeliverUsecase(ordersRepo: sl()));

  //* profile
  sl.registerLazySingleton<LoadProfileDataUsecase>(
      () => LoadProfileDataUsecase(profileRepo: sl()));
  sl.registerLazySingleton<LogoutUsecase>(() => LogoutUsecase(authRepo: sl()));

  //? repos
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
      authRemoteDataSource: sl(),
      authLocalDataSource: sl(),
      appConstants: sl()));
  sl.registerLazySingleton<MapRepo>(() => MapRepoImpl(
        localDataSource: sl(),
        remoteDataSource: sl(),
      ));
  sl.registerLazySingleton<OrdersRepo>(
      () => OrdersRepoImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<StoriesRepo>(
      () => StoriesRepoImpl(remoteDataSource: sl()));
  sl.registerLazySingleton<ProfileRepo>(
      () => ProfileRepoImpl(remoteDataSource: sl()));

  //? data sources
  //* home
  sl.registerLazySingleton<MapLocalDataSource>(() => MapLocalDataSourceImpl());
  sl.registerLazySingleton<MapRemoteDataSource>(
      () => MapRemoteDataSourceImpl(apiConsumer: sl()));
  //* login
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(prefs: sl()));
  //* orders
  sl.registerLazySingleton<OrdersRemoteDataSource>(
      () => OrdersRemoteDataSourceImpl(appConstants: sl(), apiConsumer: sl()));
  //* profile
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(appConstants: sl(), apiConsumer: sl()));
  //* stories
  sl.registerLazySingleton<StoriesRemoteDataSource>(
      () => StoriesRemoteDataSourceImpl());

  //? core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //? external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPrefs>(
      () => SharedPrefsImpl(sharedPreferences: sharedPreferences));
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
  sl.registerLazySingleton(() => Dio());

  //? constants
  sl.registerLazySingleton(() => Shared());
}
