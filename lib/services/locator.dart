import 'package:get_it/get_it.dart';
import 'package:itmentor/blocs/home_screen_bloc/home_screen_cubit.dart';
import 'package:itmentor/data/news_repository.dart';

import '../blocs/news/news_cubit.dart';
import '../data/department_repository.dart';
import 'firebase_service.dart';
import 'logging_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoggingHelper());
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerLazySingleton(() => DepartmentRepository());
  locator.registerLazySingleton(() => NewsRepository());
  locator.registerLazySingleton(() => HomeScreenCubit());
  locator.registerLazySingleton(() => NewsCubit());

}