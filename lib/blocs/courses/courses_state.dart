part of 'courses_cubit.dart';

@freezed
class CoursesState with _$CoursesState {
  const factory CoursesState.initial() = _Initial;
  const factory CoursesState.loading() = _Loading;
  const factory CoursesState.loaded(List<CourseModel> courses) = _Loaded;
  const factory CoursesState.error(String message) = _Error;
}
