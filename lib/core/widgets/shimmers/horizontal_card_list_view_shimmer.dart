import 'package:dalel/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HorizontalCardListVieweShimmer extends StatelessWidget {
  const HorizontalCardListVieweShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.2),
            highlightColor: Colors.white,
            child: Container(
              width: 166,
              height: 96,
              padding: const EdgeInsets.all(16),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                shadows: const [kBoxShadow],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 16,
          );
        },
      ),
    );
  }
}
