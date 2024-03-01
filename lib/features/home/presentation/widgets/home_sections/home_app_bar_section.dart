import 'package:dalel/features/home/presentation/widgets/custom_home_view_app_bar.dart';
import 'package:flutter/material.dart';

class HomeAppbarSection extends StatelessWidget {
  const HomeAppbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 72,
        ),
        CustomHomeViewAppBar(),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
