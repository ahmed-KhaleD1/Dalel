import 'package:dalel/core/databases/cache/cache_helper.dart';
import 'package:dalel/features/auth/presentation/model_view/auth_cubit.dart';

import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
