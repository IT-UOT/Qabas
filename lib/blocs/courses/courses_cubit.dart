import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/courses_repository.dart';
import '../../models/course.dart';

part 'courses_state.dart';
part 'courses_cubit.freezed.dart';

class CoursesCubit extends Cubit<CoursesState> {
   final CoursesRepository _coursesRepository = CoursesRepository();
  CoursesCubit() : super(const CoursesState.initial()){
    loadCourses();
  }

  Future<void> loadCourses() async {
    emit(const CoursesState.loading());
    try {
       final courses = await _coursesRepository.getCourses();
       emit(CoursesState.loaded(courses));
    } catch (e) {
      // locator<LoggingHelper>().error(e.toString());
      emit(CoursesState.error(e.toString()));
    }
  }
}
