import 'package:dalel/core/functions/custom_snackbar.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({
    super.key,
  });

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          customSnackBar(context,
              message:
                  'Your Account Created successfluly ,Check Your Email to verify you Account',
              backgroundColor: Colors.green);
          customReplacementNavigate(context, path: AppRouter.signInView);
        } else if (state is SignUpFailureState) {
          customSnackBar(context,
              message: state.errMessage, backgroundColor: Colors.redAccent);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          autovalidateMode: authCubit.autoValidateMode,
          key: authCubit.signupFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                CustomtextFormField(
                  labelText: AppStrings.fristName,
                  onChanged: (firstName) {
                    authCubit.fristName = firstName;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomtextFormField(
                  labelText: AppStrings.lastName,
                  onChanged: (lastName) {
                    authCubit.lastName = lastName;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomtextFormField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (email) {
                    authCubit.email = email;
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomtextFormField(
                  labelText: AppStrings.password,
                  onChanged: (password) {
                    authCubit.password = password;
                  },
                  ispassword: true,
                  obscureText: authCubit.obscurePassword,
                  onPressedPasswordVisibltyIcon: () {
                    authCubit.updateObscurePassword(
                        newValue: !authCubit.obscurePassword);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const TermsAndConitionWidget(),
                const SizedBox(
                  height: 88,
                ),
                state is SignUpLoadingState
                    ? const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButton(
                        text: AppStrings.signUp,
                        onPressed: authCubit.termsAndConditionCheckBoxValue
                            ? () async {
                                authCubit.updateAutoValidaionMode(
                                    mode: AutovalidateMode.always);
                                if (authCubit.signupFormKey.currentState!
                                    .validate()) {
                                  await authCubit
                                      .createAccountWithEmailAndPassword();
                                }
                              }
                            : null),
              ],
            ),
          ),
        );
      },
    );
  }
}
