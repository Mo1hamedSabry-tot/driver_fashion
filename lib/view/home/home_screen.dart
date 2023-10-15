import 'package:flutter/material.dart';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/components/atoms/shimmer_loading.dart';
import '../../app/components/elements/custom_toggle_element.dart';
import '../../app/components/elements/shimmer.dart';
import '../../app/config/routes.dart';
import '../../app/core/utils/helpers/helpers.dart';
import '../../app/core/utils/value_managers/app_constants.dart';
import '../../app/core/utils/value_managers/app_strings.dart';
import '../../app/core/utils/value_managers/size_manager.dart';
import '../../domain/entites/order_details_entity.dart';
import '../orders/bloc/orders_bloc.dart';
import '../profile/bloc/profile_bloc.dart';
import '../stories/bloc/stories_bloc.dart';
import 'bloc/home_bloc.dart';
import 'widgets/atoms/get_my_location_atom.dart';
import 'widgets/molecules/driver_avatar_molecule.dart';
import 'widgets/molecules/orders_icon.dart';
import 'widgets/organisms/default_bottom_sheet.dart';
import 'widgets/organisms/delivery_bottom_sheet.dart';
import 'widgets/organisms/google_map_organism.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late OrderDetailsEntity orderDetailsModel;

  // late OverlayEntry _overlayEntry;

  // @override
  // void initState() {
  //   super.initState();
  //   _overlayEntry = OverlayEntry(
  //     builder: (context) {
  //       return const SafeArea(
  //         child: Scaffold(
  //           backgroundColor: AppColors.transparent,
  //           body: Center(
  //             child: CircularProgressIndicator.adaptive(),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   _overlayEntry.remove();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) async {
        //? deliver order
        if (state is DeliverOrderSuccessState) {
          context.read<HomeBloc>().add(LoadReadyToDeliverEvent());
        }
        if (state is DeliverOrderFailureState) {
          AppHelpers.displaySnackBar(
              context, AppStrings.failedToConfirmDelivery);
        }

        //? get current location
        // if (state is CurrentLocationLoadingState) {
        //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //     Overlay.of(context).insert(_overlayEntry);
        //   });
        // }
        // if (state is DeliverOrderSuccessState) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     _overlayEntry.remove();
        //   });
        // }
        if (state is DeliverOrderFailureState) {
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //   _overlayEntry.remove();
          // });
          await AppHelpers.showToast(message: "Something went wrong");
        }
      },
      builder: (context, state) {
        final homeWatch = context.watch<HomeBloc>();
        final homeRead = context.read<HomeBloc>();
        return Scaffold(
          body: CustomShimmer(
            linearGradient: AppConstants.shimmerGradient,
            child: Stack(
              children: [
                GoogleMapOrganism(
                  mapController: homeWatch.mapCompleter,
                  markers: homeWatch.markers,
                  polyLines: homeWatch.polylines,
                ),
                //? custom toggle
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10.h,
                  right: 16.w,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6.r)),
                    padding: EdgeInsets.all(6.r),
                    child: CustomToggleElement(
                      isOnline: true,
                      isOrder: false,
                      onChange: (value) {},
                    ),
                  ),
                ),
                //? driver avatar
                Positioned(
                  top: MediaQuery.of(context).padding.top + 10.h,
                  left: 16.w,
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      final watch = context.watch<ProfileBloc>();
                      // return ConditionalBuilder(
                      //   condition: watch.profileEntity != null,
                      //   builder: (context) =>
                      //   fallback: (context) => const CircularProgressIndicator(),
                      // );
                      return ConditionalBuilder(
                        condition: watch.profileEntity != null,
                        builder: (context) => Hero(
                          tag: AppConstants.driverAvatarHeroTag,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.profileRoute);
                            },
                            child: DriverAvatarMolecule(
                              imageUrl: watch.profileEntity!.imgUrl,
                              rating: double.parse(watch.profileEntity!.rating),
                            ),
                          ),
                        ),
                        fallback: (context) => ShimmerLoading(
                          isLoading: watch.profileEntity == null,
                          child: Hero(
                            tag: AppConstants.driverAvatarHeroTag,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.profileRoute);
                              },
                              child: DriverAvatarMolecule(
                                imageUrl: watch.profileEntity?.imgUrl ?? "",
                                rating: double.parse(
                                    watch.profileEntity?.rating ?? "0"),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                //? orders icon
                Positioned(
                  top: MediaQuery.of(context).padding.top + 80.h,
                  left: 12.w,
                  child: BlocBuilder<OrdersBloc, OrdersState>(
                    builder: (context, state) {
                      return OrdersIcon(
                        count: context
                            .watch<OrdersBloc>()
                            .pickedOrders
                            .length
                            .toString(),
                      );
                    },
                  ),
                ),
                //? get location
                Positioned(
                  bottom: (homeWatch.readyToDeliverOrders.isEmpty
                          ? SizeManager.defaultBottomSheetHeight
                          : SizeManager.deliveryBottomSheetHeight) +
                      10.h,
                  right: 16.w,
                  child: GetMyLocationAtom(
                    onTap: () async {
                      context.read<HomeBloc>().add(GetCurrentLocationEvent());

                      // mapContoller.
                    },
                  ),
                ),
                //? bottomsheet
                Positioned(
                  bottom: 0,
                  child:
                      // ParcelBottomSheet(
                      //     parcelModel: ParcelModel.fromJson(json: _parcelJson))

                      //     DeliveryBottomSheet(
                      //   isHomeBottomSheet: true,
                      //   orderDetailsModel:
                      //       OrderDetailsEntity.fromJson(json: _deliveryJson),
                      // )
                      homeWatch.readyToDeliverOrders.isEmpty
                          ? BlocBuilder<ProfileBloc, ProfileState>(
                              builder: (context, state) {
                                final balance = context
                                    .watch<ProfileBloc>()
                                    .accountStatsEntity
                                    ?.balance;
                                return BlocBuilder<StoriesBloc, StoriesState>(
                                  builder: (context, state) {
                                    final stories =
                                        context.watch<StoriesBloc>().stories;
                                    return ConditionalBuilder(
                                      condition: balance != null,
                                      builder: (context) {
                                        return DefaultBottomSheet(
                                          stories: stories,
                                          balance: balance!,
                                        );
                                      },
                                      fallback: (context) => ShimmerLoading(
                                        isLoading: balance == null,
                                        child: DefaultBottomSheet(
                                          stories: stories,
                                          balance: balance ?? "",
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          : DeliveryBottomSheet(
                              isLoading: state is DeliverOrderLoadingState,
                              isHomeBottomSheet: true,
                              deliverCallback: () {
                                context.read<HomeBloc>().add(DeliverOrderEvent(
                                      orderId:
                                          homeRead.readyToDeliverOrders[0].id,
                                    ));
                              },
                              orderDetailsModel:
                                  homeWatch.readyToDeliverOrders[0],
                              mapIconCallback: () {
                                homeRead.add(DrawPolylineEvent(
                                    destinationLatLng: homeWatch
                                        .readyToDeliverOrders[0]
                                        .location
                                        .latLng));
                              },
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
