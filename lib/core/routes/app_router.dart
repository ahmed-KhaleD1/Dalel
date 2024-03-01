import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view/forgot_password_view.dart';
import 'package:dalel/features/auth/presentation/view/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/view/sign_up_view.dart';
import 'package:dalel/features/auth/presentation/view/verify_account_view.dart';
import 'package:dalel/features/home/presentation/views/home_view.dart';
import 'package:dalel/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String onboardingView = '/onboardingView';
  static const String signUpView = '/signUpView';
  static const String signInView = '/signInView';
  static const String forgotPasswordView = '/forgotPasswordView';
  static const String verifyAccountView = '/verifyAccountView';
  static const String homeView = '/homeView';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: splashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: onboardingView,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: signUpView,
      builder: (context, state) => BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: signInView,
      builder: (context, state) => BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: forgotPasswordView,
      builder: (context, state) => BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: const ForgotPasswordView(),
      ),
    ),
    GoRoute(
      path: verifyAccountView,
      builder: (context, state) => BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: const VerifyAccountView(),
      ),
    ),
    GoRoute(
      path: homeView,
      builder: (context, state) => const HomeView(),
    )
  ]);
}
