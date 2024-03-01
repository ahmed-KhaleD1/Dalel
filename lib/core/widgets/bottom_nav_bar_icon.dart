import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Image.asset(image),
    );
  }
}
