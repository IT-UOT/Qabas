import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/department_repository.dart';
import '../../models/department.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.g.dart';
part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends HydratedCubit<HomeScreenState> {
  final DepartmentRepository _departmentRepository;

  HomeScreenCubit(this._departmentRepository) : super(const HomeScreenState.initial()){
     loadDepartments();
   }

  Future<void> loadDepartments() async {
    emit(const HomeScreenState.loading());
    try {
      final departments = await _departmentRepository.getDepartments();
      emit(HomeScreenState.loaded(departments));
    } catch (e) {
      print(e);
      emit(HomeScreenState.error(e.toString()));
    }
  }

  @override
  HomeScreenState? fromJson(Map<String, dynamic> json) {
    try {
      return HomeScreenState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(HomeScreenState state) {
    return state.toJson();
  }

  @override
  void onHydrate( event) {
    // Load state from local storage
    emit(fromJson(event.data) ?? const HomeScreenState.initial());
  }

  @override
  void onDehydrate( event) {
    // Save state to local storage
    final state = toJson(this.state);
    if (state != null) {
      event.data = state;
    }
  }

}
