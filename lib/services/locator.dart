import 'package:get_it/get_it.dart';
import 'package:itmentor/services/api_service.dart';
import 'package:itmentor/services/fake_data_service.dart';

import '../data/department_repository.dart';
import 'firebase_service.dart';
import 'logging_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoggingHelper());
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerLazySingleton(() => DepartmentRepository(FirebaseService()));

}