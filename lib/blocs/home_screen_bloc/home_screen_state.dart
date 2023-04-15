part of 'home_screen_cubit.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState.initial() = _Initial;
  const factory HomeScreenState.loading() = _Loading;
  const factory HomeScreenState.loaded(List<DepartmentModel> departments) = _Loaded;
  const factory HomeScreenState.error(String message) = _Error;
}