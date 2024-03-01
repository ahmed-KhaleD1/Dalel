import 'package:dalel/core/utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget(
      {super.key,
      required this.onTap,
      required this.text1,
      required this.text2});
  final VoidCallback onTap;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: text1,
          style: AppStyles.poppinsRegular12(context),
        ),
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = onTap,
          text: text2,
          style: AppStyles.poppinsRegular12(context)
              .copyWith(color: const Color(0xFFB4B4B4)),
        )
      ])),
    );
  }
}
