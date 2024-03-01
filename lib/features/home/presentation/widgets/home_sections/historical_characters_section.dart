import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/core/widgets/list_views/custom_vertical_card_list_view.dart';
import 'package:dalel/core/models/historical_data_model.dart';
import 'package:flutter/material.dart';

class HistoricalCharacterSection extends StatelessWidget {
  const HistoricalCharacterSection({super.key, required this.items});
  final List<HistoricalDataModel> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeaderText(text: AppStrings.historicalCharacters),
        const SizedBox(
          height: 16,
        ),
        CustomVerticalCardListView(items: items),
        const SizedBox(
          height: 32,
        )
      ],
    );
  }
}
