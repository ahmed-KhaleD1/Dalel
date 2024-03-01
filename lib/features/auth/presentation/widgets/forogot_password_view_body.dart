import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_styles.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_forgot_password_form.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot_password_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordViewBody extends StatelessWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 64,
            ),
            Text(
              AppStrings.forgotPasswordPage,
              textAlign: TextAlign.center,
              style: AppStyles.poppinsSemiBold24(context),
            ),
            const SizedBox(
              height: 40,
            ),
            const ForgotPasswordImage(),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                'Enter your registered email below to receive password reset instruction',
                textAlign: TextAlign.center,
                style: AppStyles.poppinsRegular14(context),
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            const CustomForgotPasswordForm(),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
