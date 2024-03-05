import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/core/widgets/bottom_nav_bar_icon.dart';
import 'package:flutter/material.dart';

class CustomBottonNavBar extends StatefulWidget {
  const CustomBottonNavBar({super.key});

  @override
  State<CustomBottonNavBar> createState() => _CustomBottonNavBarState();
}

class _CustomBottonNavBarState extends State<CustomBottonNavBar> {
  int selectedIndex = 0;
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavBarItem(
                inactiveImage: Assets.imagesIconsHome,
                activeImage: Assets.imagesIconsHomeActive,
                isActive: selectedIndex == 0,
                onPressed: () {
                  selectedIndex = 0;
                  setState(() {
                    customReplacementNavigate(context,
                        path: AppRouter.homeView);
                  });
                },
              ),
              BottomNavBarItem(
                inactiveImage: Assets.imagesIconsShoppingCart,
                activeImage: Assets.imagesIconsShoppingCartActive,
                isActive: selectedIndex == 1,
                onPressed: () {
                  selectedIndex = 1;
                  setState(() {});
                },
              ),
              BottomNavBarItem(
                inactiveImage: Assets.imagesIconsSearch,
                activeImage: Assets.imagesIconsSearchActive,
                isActive: selectedIndex == 2,
                onPressed: () {
                  selectedIndex = 2;
                  setState(() {});
                },
              ),
              BottomNavBarItem(
                inactiveImage: Assets.imagesIconsProfile,
                activeImage: Assets.imagesIconsProfileActive,
                isActive: selectedIndex == 3,
                onPressed: () {
                  selectedIndex = 3;
                  setState(() {});
                },
              ),
            ],
          )),
    );
  }
}
