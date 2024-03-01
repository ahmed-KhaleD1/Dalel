import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_styles.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConitionWidget extends StatefulWidget {
  const TermsAndConitionWidget({super.key});

  @override
  State<TermsAndConitionWidget> createState() => _TermsAndConitionWidgetState();
}

class _TermsAndConitionWidgetState extends State<TermsAndConitionWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            side: BorderSide(
                color: const Color(0xFF0F0D23).withOpacity(0.2), width: 1),
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
                BlocProvider.of<AuthCubit>(context)
                    .updateTermsAndConditionCheckBox(newValue: value);
              });
            }),
        const SizedBox(
          width: 4,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.iHaveAgreeToOur,
                style: AppStyles.poppinsRegular12(context),
              ),
              TextSpan(
                text: AppStrings.termsAndCondition,
                style: AppStyles.poppinsRegular12(context)
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ],
          ),
        )
      ],
    );
  }
}
