import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/components/elements/title_icon.dart';
import '../../../app/core/utils/value_managers/app_strings.dart';
import '../items/income_item.dart';

class TransactionsMolecule extends StatelessWidget {
  final String balance;
  final double rating;

  const TransactionsMolecule({
    super.key,
    required this.balance,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndIcon(
          title: AppStrings.deliverymanTransactions,
        ),
        12.verticalSpace,
        IncomeItem(
          title: AppStrings.wallet,
          price: "\$$balance",
        ),
        IncomeItem(
          title: AppStrings.rating,
          price: rating.toStringAsFixed(1),
        ),
      ],
    );
  }
}
