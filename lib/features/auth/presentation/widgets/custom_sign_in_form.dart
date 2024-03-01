import 'package:dalel/core/functions/custom_snackbar.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/forgot_password_text_widget.dart';
import 'package:dalel/features/auth/presentation/widgets/have_an%20_accout_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is SignInSuccessState) {
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          customSnackBar(context,
              message: 'Successfully login', backgroundColor: Colors.green);
          customReplacementNavigate(context, path: AppRouter.homeView);
        } else {
          customSnackBar(context,
              message: 'Please Cheack your email for Verfication',
              backgroundColor: AppColors.grey);
        }
      } else if (state is SignInFailureState) {
        customSnackBar(context,
            message: state.errMessage, backgroundColor: Colors.red);
      }
    }, builder: (context, state) {
      AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
      return Form(
        key: authCubit.signinFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomtextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (email) {
                  authCubit.email = email;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomtextFormField(
                labelText: AppStrings.password,
                ispassword: true,
                obscureText: authCubit.obscurePassword,
                onPressedPasswordVisibltyIcon: () {
                  authCubit.updateObscurePassword(
                      newValue: !authCubit.obscurePassword);
                },
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: ForgotPasswordTextWidget(onTap: () {
                    customNavigate(context, path: AppRouter.forgotPasswordView);
                  })),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.11,
              ),
              state is SignInLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomButton(
                      text: AppStrings.signIn,
                      onPressed: () {
                        authCubit.updateAutoValidaionMode(
                            mode: AutovalidateMode.always);
                        if (authCubit.signinFormKey.currentState!.validate()) {
                          authCubit.signInWithEmailAndPassword();
                        }
                      }),
              const SizedBox(
                height: 16,
              ),
              HaveAnAccountWidget(
                  onTap: () {
                    customReplacementNavigate(context,
                        path: AppRouter.signUpView);
                  },
                  text1: AppStrings.dontHaveAnAccount,
                  text2: AppStrings.signUp),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      );
    });
  }
}
