import 'package:dalel/core/models/historical_data_model.dart';
import 'package:dalel/core/widgets/custom_horizontal_card.dart';
import 'package:flutter/material.dart';

class CustomHorizontalCardListView extends StatelessWidget {
  const CustomHorizontalCardListView({super.key, required this.items});
  final List<HistoricalDataModel> items;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomHorizontalCard(cardItem: items[index]);
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
