import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/department_repository.dart';
import '../../models/department.dart';
import '../../services/locator.dart';
import '../../services/logging_service.dart';

part 'departments_state.dart';
part 'departments_cubit.g.dart';
part 'departments_cubit.freezed.dart';

class DepartmentsCubit extends Cubit<DepartmentsState> {
  final DepartmentRepository _departmentRepository = DepartmentRepository();

  DepartmentsCubit() : super(const DepartmentsState.initial()) {
    loadDepartments();
  }

  Future<void> loadDepartments() async {
    emit(const DepartmentsState.loading());
    try {
      final departments = await _departmentRepository.getDepartments();
      emit(DepartmentsState.loaded(departments));
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      emit(DepartmentsState.error(e.toString()));
    }
  }

  Future<void> createDepartment(DepartmentModel department) async {
        emit(const DepartmentsState.loading());

    try {
      await _departmentRepository.createDepartment(department);
      loadDepartments();
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      emit(DepartmentsState.error(e.toString()));
    }
  }

  Future<void> updateDepartment(DepartmentModel department) async {
        emit(const DepartmentsState.loading());

    try {
      await _departmentRepository.updateDepartment(department);
      final currentState = state;
      loadDepartments();
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      emit(DepartmentsState.error(e.toString()));
    }
  }

  Future<void> deleteDepartment(String departmentId) async {
        emit(const DepartmentsState.loading());

    try {
      await _departmentRepository.deleteDepartment(departmentId);
      final currentState = state;
      loadDepartments();
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      emit(DepartmentsState.error(e.toString()));
    }
  }
}