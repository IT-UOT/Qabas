import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/about_repository.dart';
import '../../models/about.dart';

part 'about_state.dart';

part 'about_cubit.freezed.dart';

class AboutCubit extends Cubit<AboutState> {
  // inject about repository
  final AboutRepository _aboutRepository = AboutRepository();

  AboutCubit() : super(const AboutState.initial()) {
    fetchAbout();
  }

  /// fetch about
  Future<void> fetchAbout() async {
    emit(const AboutState.loading());
    try {
      final about = await _aboutRepository.getAbout();
        emit(AboutState.loaded(about));
      
      
    } catch (e) {
      emit(AboutState.error(e.toString()));
    }
  }

  /// upload about
  Future<void> uploadAbout(AboutModel about) async {
    emit(const AboutState.loading());
    await _aboutRepository.uploadAbout(about).onError((error, stackTrace) {
      emit(AboutState.error(error.toString()));
    });
    emit(const AboutState.initial());
  }

  /// update about
  Future<void> updateAbout(AboutModel about) async {
    emit(const AboutState.loading());
    await _aboutRepository.updateAbout(about).onError((error, stackTrace) {
      emit(AboutState.error(error.toString()));
    });
    emit(const AboutState.initial());
  }

  /// delete about
  Future<void> deleteAbout(AboutModel about) async {
    emit(const AboutState.loading());
    await _aboutRepository.deleteAbout(about).onError((error, stackTrace) {
      emit(AboutState.error(error.toString()));
    });
    emit(const AboutState.initial());
  }
}
