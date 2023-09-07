import 'package:itmentor/models/about.dart';
import 'package:itmentor/services/firebase_service.dart';
import 'package:itmentor/services/locator.dart';
import 'package:itmentor/services/logging_service.dart';

class AboutRepository {
  final FirebaseService _firebaseService = locator<FirebaseService>();
  AboutModel? about;

  Future<AboutModel?> getAbout() async {
    final res =
        await _firebaseService.fetchAbout().onError((error, stackTrace) {
      throw error.toString();
    });
    about = res;
    return about;
  }

  Future<void> uploadAbout(AboutModel about) async {
    await _firebaseService.uploadAbout(about).onError((error, stackTrace) {
      locator<LoggingHelper>().error(error.toString());
      //throw error.toString();
    });
  }
   Future<void> updateAbout(AboutModel about) async {
    await _firebaseService.updateAbout(about).onError((error, stackTrace) {
      locator<LoggingHelper>().error(error.toString());
      //throw error.toString();
    });
  }

  Future<void> deleteAbout(AboutModel about) async {
    await _firebaseService.deleteAbout(about).onError((error, stackTrace) {
      locator<LoggingHelper>().error(error.toString());
      //throw error.toString();
    });
  }
}
