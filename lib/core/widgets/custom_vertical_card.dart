import 'package:dalel/constants.dart';
import 'package:dalel/core/utils/app_styles.dart';
import 'package:dalel/core/models/historical_data_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomVerticalCard extends StatelessWidget {
  const CustomVerticalCard({super.key, required this.cardItem});
  final HistoricalDataModel cardItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 150,
      padding: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadows: const [kBoxShadow],
      ),
      child: Column(
        children: [
          Container(
            width: 74,
            height: 108,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(cardItem.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              cardItem.title,
              style: AppStyles.poppinsMedium14(context),
            ),
          ),
        ],
      ),
    );
  }
}
