import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/core/models/historical_data_model.dart';
import 'package:dalel/core/widgets/list_views/custom_horizontal_card_list_view.dart';
import 'package:flutter/material.dart';

class HistoricalperiodsSection extends StatelessWidget {
  const HistoricalperiodsSection({super.key, required this.items});
  final List<HistoricalDataModel> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomHeaderText(text: AppStrings.historicalPeriods),
        const SizedBox(
          height: 16,
        ),
        CustomHorizontalCardListView(items: items),
        const SizedBox(
          height: 32,
        )
      ],
    );
  }
}
