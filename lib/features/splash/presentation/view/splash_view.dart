import 'package:dalel/constants.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/databases/cache/cache_helper.dart';
import 'package:dalel/core/utils/app_fonts.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isOnBoardingVisted =
        CacheHelper().getData(key: kIsOnBaordingVisitedKey) ?? false;
    if (isOnBoardingVisted) {
      if (FirebaseAuth.instance.currentUser != null) {
        FirebaseAuth.instance.currentUser!.emailVerified
            ? delayedNavigation(path: AppRouter.homeView)
            : delayedNavigation(path: AppRouter.signInView);
      } else {
        delayedNavigation(path: AppRouter.signUpView);
      }
    } else {
      delayedNavigation(path: AppRouter.onboardingView);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: TextStyle(
            color: Color(0xFF6B4B3E),
            fontSize: 64,
            fontFamily: AppFonts.pacifico,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  void delayedNavigation({required String path}) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        customReplacementNavigate(context, path: path);
      },
    );
  }
}
