import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/verification_code_widget.dart';
import 'package:flutter/material.dart';

class VerifyAccountViewBody extends StatelessWidget {
  const VerifyAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 144,
        ),
        Text(
          AppStrings.verifyAccount,
          textAlign: TextAlign.center,
          style: AppStyles.poppinsSemiBold24(context),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          AppStrings.enter4DigitCodeWeHaveSentTo,
          textAlign: TextAlign.center,
          style: AppStyles.poppinsRegular14(context),
        ),
        const SizedBox(
          height: 32,
        ),
        const Expanded(child: VerificationCodeFormWidget()),
      ],
    );
  }
}
