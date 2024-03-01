import 'package:dalel/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPasswordImage extends StatelessWidget {
  const ForgotPasswordImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.6,
      child: AspectRatio(
        aspectRatio: 1,
        child: SvgPicture.asset(Assets.imagesForgotPassword),
      ),
    );
  }
}
