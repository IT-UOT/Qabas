part of 'departments_cubit.dart';


@freezed
class DepartmentsState with _$DepartmentsState {
  const factory DepartmentsState() = _HomeScreenState;
  const factory DepartmentsState.initial() = _Initial;
  const factory DepartmentsState.loading() = _Loading;
  const factory DepartmentsState.loaded(List<DepartmentModel> departments) = _Loaded;
  const factory DepartmentsState.error(String message) = _Error;

  factory DepartmentsState.fromJson(Map<String, dynamic> json) => _$DepartmentsStateFromJson(json);
  //Map<String, dynamic> toJson() => _$HomeScreenStateToJson(this);
}