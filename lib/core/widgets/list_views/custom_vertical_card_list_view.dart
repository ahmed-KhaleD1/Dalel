import 'package:dalel/core/widgets/custom_vertical_card.dart';
import 'package:dalel/core/models/historical_data_model.dart';
import 'package:flutter/material.dart';

class CustomVerticalCardListView extends StatelessWidget {
  const CustomVerticalCardListView({super.key, required this.items});
  final List<HistoricalDataModel> items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
        itemBuilder: (context, index) {
          return CustomVerticalCard(cardItem: items[index]);
        },
      ),
    );
  }
}
