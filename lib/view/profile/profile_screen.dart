import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app/config/routes.dart';
import '../../app/config/routing_helper.dart';
import '../../app/core/utils/helpers/helpers.dart';
import '../../app/core/utils/theming/app_colors.dart';
import '../../app/core/utils/value_managers/app_strings.dart';
import 'bloc/profile_bloc.dart';
import 'widgets/molecules/account_stats_molecule.dart';
import 'widgets/molecules/custom_floating_molecule.dart';
import 'widgets/organisms/profile_app_bar.dart';
import 'widgets/organisms/sections_organism.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          // Navigator.pushNamedAndRemoveUntil(
          //     context, Routes.loginRoute, (route) => false);
          navigateNamedAndRemoveAll(context, route: Routes.loginRoute);
        }
        if (state is LogoutFailureState) {
          AppHelpers.showToast(message: AppStrings.logoutFailed);
        }
      },
      builder: (context, state) {
        final watch = context.watch<ProfileBloc>();
        final read = context.read<ProfileBloc>();
        final driverEntity = watch.profileEntity!;
        final accountStatsEntity = watch.accountStatsEntity!;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.greyColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          floatingActionButton: const CustomFloatingMolecule(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90.h),
            child: ProfileAppBar(
              isLoggingOut: state is LogoutLoadingState,
              profileImg: driverEntity.imgUrl,
              rating: double.parse(driverEntity.rating),
              name: driverEntity.name,
              id: driverEntity.id,
              logoutAction: () {
                read.add(LogoutEvent());
              },
            ),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                AccountStats(
                  balance: accountStatsEntity.balance,
                  deliveredOrders: accountStatsEntity.deliveredOrders,
                  lastProfit: accountStatsEntity.lastProfit,
                ),
                const SectionsOrganism(),
              ],
            ),
          ),
        );
      },
    );
  }
}
