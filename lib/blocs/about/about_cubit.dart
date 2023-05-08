import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itmentor/models/team_member.dart';

import '../../data/about_repository.dart';
import '../../models/about.dart';

part 'about_state.dart';

part 'about_cubit.freezed.dart';

class AboutCubit extends Cubit<AboutState> {
  // inject about repository
  final AboutRepository _aboutRepository = AboutRepository();

  AboutCubit() : super(const AboutState.initial()) {

    fetchAbout();
    //  emit(const AboutState.loaded( AboutModel(
    //    sections: {
    //      "من نحن": "تطبيق طلابي للتواصل بين الطلاب والمعلمين",
    //      "الرؤية": "تطوير التعليم",
    //      "الرسالة": "تطوير التعليم",
    //    },
    //    team: [
    //      TeamMemberModel(
    //        name: "عبدالله عراب",
    //        role: "مطور تطبيقات",
    //        bio: "طالب في كلية تقنية المعلومات - جامعة طرابلس",
    //        links: {
    //          "فيسبوك": "https://www.facebook.com/abdo.arab.7587",
    //          "تويتر": "https://twitter.com/abdoarab18",
    //          "انستجرام": "https://www.instagram.com/a_arab06/",
    //          "لينكدان": "https://www.linkedin.com/in/abdullah-arab-1451961b6/",
    //          "github": "https://github.com/Abdullah-Arab",
    //        },
    //      ),
    //      TeamMemberModel(
    //        name: "محمد بن نوبة",
    //        role: "مصمم ترجبة المستخدم",
    //        bio: "طالب في كلية تقنية المعلومات - جامعة طرابلس",
    //        links: {
    //          "فيسبوك": "https://www.facebook.com/mohamed.bennoba.969",
    //          "تويتر": "https://twitter.com/bennoba",
    //          "انستجرام": "https://www.instagram.com/mohamed.benoba/",
    //          "لينكدان": "https://www.linkedin.com/in/mohamed-ben-noba-99053719b/",
    //          "github": "https://github.com/mohamed-benoba",
    //        },
    //      ),
    //    ],
    //    socialMedia: {
    //      "فيسبوك": "https://www.facebook.com/",
    //      "تويتر": "https://twitter.com/",
    //      "انستجرام": "https://www.instagram.com/",
    //      "لينكدان": "https://www.linkedin.com/",
    //      "github": "https://github.com/",
    //    },
    //  )));
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
}
