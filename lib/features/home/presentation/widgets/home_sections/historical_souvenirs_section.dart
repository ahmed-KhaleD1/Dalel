import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/core/widgets/list_views/custom_vertical_card_list_view.dart';
import 'package:dalel/core/models/historical_data_model.dart';
import 'package:dalel/features/home/presentation/widgets/historical_souvenirs.dart';
import 'package:flutter/material.dart';

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(text: AppStrings.historicalSouvenirs),
        SizedBox(
          height: 16,
        ),
        HistoricalSouvenirs(),
        SizedBox(height: 32),
      ],
    );
  }
}
