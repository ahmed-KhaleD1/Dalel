import 'package:dalel/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VerticalCardListViewShimmer extends StatelessWidget {
  const VerticalCardListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.2),
            highlightColor: Colors.white,
            child: Container(
              width: 74,
              height: 150,
              padding: const EdgeInsets.only(bottom: 12),
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
      ),
    );
  }
}
