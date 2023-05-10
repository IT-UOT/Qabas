part of 'home_screen_cubit.dart';


@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState() = _HomeScreenState;
  const factory HomeScreenState.initial() = _Initial;
  const factory HomeScreenState.loading() = _Loading;
  const factory HomeScreenState.loaded(List<DepartmentModel> departments) = _Loaded;
  const factory HomeScreenState.error(String message) = _Error;

  factory HomeScreenState.fromJson(Map<String, dynamic> json) => _$HomeScreenStateFromJson(json);
  //Map<String, dynamic> toJson() => _$HomeScreenStateToJson(this);
}