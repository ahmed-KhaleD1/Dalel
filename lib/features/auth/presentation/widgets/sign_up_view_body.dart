import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_styles.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an%20_accout_widget.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 108,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              AppStrings.welcome,
              textAlign: TextAlign.center,
              style: AppStyles.poppinsBlack28(context),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 48,
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomSignUpForm(),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 40),
                child: HaveAnAccountWidget(
                  text1: AppStrings.alreadyHaveAnAccount,
                  text2: AppStrings.signIn,
                  onTap: () {
                    customReplacementNavigate(context,
                        path: AppRouter.signInView);
                  },
                )),
          )
        ],
      ),
    );
  }
}
