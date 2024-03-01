import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_styles.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/widgets/one_digit_text_field.dart';
import 'package:flutter/material.dart';

class VerificationCodeFormWidget extends StatelessWidget {
  const VerificationCodeFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return const OneDigitTextField();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 16,
                );
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            AppStrings.haventReceivedVerificationCode,
            textAlign: TextAlign.center,
            style: AppStyles.poppinsRegular14(context),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            AppStrings.resendCode,
            textAlign: TextAlign.center,
            style: AppStyles.poppinsRegular16(context).copyWith(
                decoration: TextDecoration.underline,
                color: AppColors.deepGrey),
          ),
          const Expanded(
            child: SizedBox(
              height: 110,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              text: AppStrings.verificationNow,
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
