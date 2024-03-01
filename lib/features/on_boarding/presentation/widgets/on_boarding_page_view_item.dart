import 'package:dalel/core/utils/app_styles.dart';
import 'package:dalel/core/widgets/custom_dots_indicator.dart';
import 'package:dalel/features/on_boarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPageViewItem extends StatelessWidget {
  const OnBoardingPageViewItem(
      {super.key, required this.item, required this.currentPageIndex});
  final OnBoradingModel item;
  final int currentPageIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(item.image),
        const SizedBox(height: 24),
        CustomDotsIndicator(currentPageIndex: currentPageIndex),
        const SizedBox(height: 32),
        Text(item.firstTittle,
            textAlign: TextAlign.center,
            style: AppStyles.poppinsMedium24(context)),
        const SizedBox(
          height: 16,
        ),
        Text(item.secondTittle,
            textAlign: TextAlign.center,
            style: AppStyles.poppinsLight16(context))
      ],
    );
  }
}
