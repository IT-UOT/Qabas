import 'package:get_it/get_it.dart';
import 'package:itmentor/blocs/about/about_cubit.dart';
import 'package:itmentor/blocs/home_screen_bloc/home_screen_cubit.dart';

import 'package:itmentor/utilities/consts.dart';

import '../blocs/news/news_cubit.dart';
import 'firebase_service.dart';
import 'logging_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoggingHelper());
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerLazySingleton(() => HomeScreenCubit());
  locator.registerLazySingleton(() => NewsCubit());
  locator.registerLazySingleton(() => AboutCubit());
}
