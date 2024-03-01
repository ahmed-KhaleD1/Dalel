import 'package:dalel/constants.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/databases/cache/cache_helper.dart';
import 'package:dalel/core/services/service_locator.dart';
import 'package:dalel/core/utils/app_color.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view/verify_account_view.dart';
import 'package:dalel/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
  );
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(DevicePreview(
      enabled: isInDebgeMode, builder: (context) => const Dalel()));
}

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      theme: ThemeData(scaffoldBackgroundColor: AppColors.offWhite),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
