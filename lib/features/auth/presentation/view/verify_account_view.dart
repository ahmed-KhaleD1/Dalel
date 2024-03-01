import 'package:dalel/features/auth/presentation/widgets/verify_account_view_body.dart';
import 'package:flutter/material.dart';

class VerifyAccountView extends StatelessWidget {
  const VerifyAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: VerifyAccountViewBody(),
    );
  }
}
