import 'package:dalel/constants.dart';
import 'package:dalel/core/utils/app_styles.dart';
import 'package:dalel/core/models/historical_data_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomHorizontalCard extends StatelessWidget {
  const CustomHorizontalCard({super.key, required this.cardItem});
  final HistoricalDataModel cardItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166,
      height: 96,
      padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadows: const [kBoxShadow],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              cardItem.title,
              textAlign: TextAlign.start,
              style: AppStyles.poppinsMedium16(context),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            width: 47,
            height: 64,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(cardItem.image),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          )
        ],
      ),
    );
  }
}
