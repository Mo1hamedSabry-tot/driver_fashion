import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/theming/app_colors.dart';
import '../../../view/orders/widgets/molecules/order_party_details_molecule.dart';

class ITSMolecule extends StatelessWidget {
  const ITSMolecule({
    super.key,
    required this.img,
    required this.title,
    required this.subTitle,
    this.extraDetail,
  });

  final Widget? img;
  final String title;
  final String subTitle;
  final String? extraDetail;

  @override
  Widget build(BuildContext context) {
    return ProfileElementPadding(
      child: ITSInsides(
          img: img, title: title, subTitle: subTitle, extraDetail: extraDetail),
    );
  }
}

class ProfileElementPadding extends StatelessWidget {
  const ProfileElementPadding({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        // TODO
        padding: const EdgeInsets.all(12),
        child: child);
  }
}

class ITSInsides extends StatelessWidget {
  const ITSInsides({
    super.key,
    required this.img,
    required this.title,
    required this.subTitle,
    this.extraDetail,
  });

  final Widget? img;
  final String title;
  final String subTitle;
  final String? extraDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        img ?? const SizedBox.shrink(),
        16.horizontalSpace,
        OrderPartyDetailsMolecule(
          title: title,
          subTitle: subTitle,
          extraDetail: extraDetail,
        ),
      ],
    );
  }
}
