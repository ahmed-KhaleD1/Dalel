import 'package:dalel/constants.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/databases/cache/cache_helper.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/custom_page_view.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/login_button.dart';
import 'package:dalel/features/on_boarding/presentation/widgets/skip_button.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPageIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: currentPageIndex == 2
                          ? null
                          : SkipButton(onTap: () {
                              getIt<CacheHelper>().put(
                                  key: kIsOnBaordingVisitedKey, value: true);
                              customReplacementNavigate(context,
                                  path: AppRouter.signInView);
                            }),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: CustomPageView(
                      pageController: pageController,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
                text: currentPageIndex == 2 ? 'Create Account' : 'Next',
                onPressed: () {
                  currentPageIndex == 2
                      ? customReplacementNavigate(context,
                          path: AppRouter.signUpView)
                      : pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                }),
            LayoutBuilder(
              builder: (context, constraints) {
                if (currentPageIndex == 2) {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 30, top: 16),
                      child: LoginButton(
                        onTap: () {
                          getIt<CacheHelper>()
                              .put(key: kIsOnBaordingVisitedKey, value: true);
                          customReplacementNavigate(context,
                              path: AppRouter.signUpView);
                        },
                      ));
                } else {
                  return const SizedBox(
                    height: 40,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
