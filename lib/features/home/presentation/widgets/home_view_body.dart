import 'package:dalel/features/home/presentation/widgets/home_sections/historical_periods_section.dart';
import 'package:dalel/features/home/presentation/widgets/home_sections/home_app_bar_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          HomeAppbarSection(),
          Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: HistoricalperiodsSection()),
                // SliverToBoxAdapter(
                //   child: HistoricalCharacterSection(items: items),
                // ),
                // SliverToBoxAdapter(
                //     child: HistoricalSouvenirsSection(items: items))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
