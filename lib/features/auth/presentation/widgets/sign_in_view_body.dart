import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_sign_in_form.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_banner_widget.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WelcomeBannerWidet(),
          const SizedBox(
            height: 32,
          ),
          Text(
            AppStrings.welcomeBack,
            textAlign: TextAlign.center,
            style: AppStyles.poppinsSemiBold24(context),
          ),
          const SizedBox(
            height: 56,
          ),
          const CustomSignInForm(),
        ],
      ),
    );
  }
}
