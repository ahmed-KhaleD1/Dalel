import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/features/on_boarding/data/models/onboarding_model.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/on_boarding_page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:expandable_page_view/expandable_page_view.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});
  final PageController pageController;
  final List<OnBoradingModel> items = const [
    OnBoradingModel(
        image: Assets.imagesOnboarding1,
        firstTittle: 'Explore The history with Dalel in a smart way',
        secondTittle:
            'Using our app’s history libraries  you can find many historical periods'),
    OnBoradingModel(
        image: Assets.imagesOnboarding2,
        firstTittle: 'From every place on earth',
        secondTittle:
            'A big variety of ancient places from all over the world'),
    OnBoradingModel(
        image: Assets.imagesOnboarding3,
        firstTittle: 'Using modern AI technology for better user experience',
        secondTittle:
            'AI provide recommendations and helps you to continue the search journey'),
  ];
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      controller: pageController,
      itemCount: 3,
      itemBuilder: (context, index) {
        return OnBoardingPageViewItem(
            item: items[index], currentPageIndex: index);
      },
    );
  }
}
