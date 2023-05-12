import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import '../../data/department_repository.dart';
import '../../models/department.dart';
import '../../services/locator.dart';
import '../../services/logging_service.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.g.dart';
part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final DepartmentRepository _departmentRepository = DepartmentRepository();

  HomeScreenCubit() : super(const HomeScreenState.initial()){
     loadDepartments();
   }

  Future<void> loadDepartments() async {
    emit(const HomeScreenState.loading());
    try {
      final departments = await _departmentRepository.getDepartments();
      emit(HomeScreenState.loaded(departments));
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      emit(HomeScreenState.error(e.toString()));
    }
  }


}
