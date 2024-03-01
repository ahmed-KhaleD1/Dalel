import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeBannerWidet extends StatelessWidget {
  const WelcomeBannerWidet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.35,
      color: AppColors.primaryColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text(
          AppStrings.appName,
          textAlign: TextAlign.center,
          style: AppStyles.sariaBold32(context),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(Assets.imagesSignInImage1),
            SvgPicture.asset(Assets.imagesSignInImage2),
          ],
        )
      ]),
    );
  }
}
