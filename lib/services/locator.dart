import 'package:get_it/get_it.dart';
import 'package:itmentor/blocs/about/about_cubit.dart';
import 'package:itmentor/blocs/courses/courses_cubit.dart';


import '../blocs/departments/departments_cubit.dart';
import '../blocs/news/news_cubit.dart';
import 'firebase_service.dart';
import 'logging_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoggingHelper());
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerLazySingleton(() => DepartmentsCubit());
  locator.registerLazySingleton(() => NewsCubit());
  locator.registerLazySingleton(() => AboutCubit());
  locator.registerLazySingleton(() => CoursesCubit());
}
