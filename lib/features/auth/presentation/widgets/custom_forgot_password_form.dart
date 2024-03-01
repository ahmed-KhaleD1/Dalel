import 'package:dalel/core/functions/custom_snackbar.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_form_field.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccessState) {
          customSnackBar(context,
              message: 'Cheack your Email', backgroundColor: Colors.green);
          customReplacementNavigate(context, path: AppRouter.signInView);
        } else if (state is ForgotPasswordFailureState) {
          customSnackBar(context,
              message: state.errMessage, backgroundColor: Colors.red);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.forgotPasswordFormKey,
          child: Column(
            children: [
              CustomtextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (email) {
                  authCubit.email = email;
                },
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
              state is ForgotPasswordLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomButton(
                      text: 'Send Verification Code',
                      onPressed: () {
                        authCubit.updateAutoValidaionMode(
                            mode: AutovalidateMode.always);
                        if (authCubit.forgotPasswordFormKey.currentState!
                            .validate()) {
                          authCubit.forgotPassword();
                        }
                      },
                    )
            ],
          ),
        );
      },
    );
  }
}
