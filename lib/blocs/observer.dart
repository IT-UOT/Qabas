import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itmentor/services/locator.dart';

import '../services/logging_service.dart';

class Observer extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    locator<LoggingHelper>().info('${bloc.runtimeType}\n$change');
    //print('${bloc.runtimeType} $change');
    super.onChange(bloc, change);
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    locator<LoggingHelper>().error('${bloc.runtimeType}\n$error');
    //print('${bloc.runtimeType} $error');
    super.onError(bloc, error, stackTrace);
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    locator<LoggingHelper>().info('${bloc.runtimeType}\n$transition');
    //print('${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }
}