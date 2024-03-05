import 'package:flutter/material.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({
    super.key,
    required this.activeImage,
    required this.inactiveImage,
    this.onPressed,
    required this.isActive,
  });
  final String activeImage;
  final String inactiveImage;
  final void Function()? onPressed;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        isActive ? activeImage : inactiveImage,
      ),
    );
  }
}
