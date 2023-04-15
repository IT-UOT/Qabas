import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/department_repository.dart';
import '../../models/department.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';


class HomeScreenCubit extends Cubit<HomeScreenState> {
  final DepartmentRepository _departmentRepository;

  HomeScreenCubit(this._departmentRepository) : super(HomeScreenState.loading()) {
    _loadDepartments();
  }

  Future<void> _loadDepartments() async {
    try {
      final departments = await _departmentRepository.getDepartments();
      emit(HomeScreenState.loaded(departments));
    } catch (e) {
      emit(HomeScreenState.error(e.toString()));
    }
  }

}
