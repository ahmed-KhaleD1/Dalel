import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/widgets/bottom_nav_bar_icon.dart';
import 'package:flutter/material.dart';

class CustomBottonNavBar extends StatelessWidget {
  const CustomBottonNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.all(0),
      child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavBarItem(image: Assets.imagesIconsHome),
              BottomNavBarItem(image: Assets.imagesIconsShoppingCart),
              BottomNavBarItem(image: Assets.imagesIconsSearch),
              BottomNavBarItem(image: Assets.imagesIconsProfile),
            ],
          )),
    );
  }
}
