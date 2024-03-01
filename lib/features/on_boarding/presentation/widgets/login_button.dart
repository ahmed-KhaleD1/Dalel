import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'Login Now',
        textAlign: TextAlign.center,
        style: AppStyles.poppinsRegular16(context).copyWith(
            decoration: TextDecoration.underline, color: AppColors.deepGrey),
      ),
    );
  }
}
