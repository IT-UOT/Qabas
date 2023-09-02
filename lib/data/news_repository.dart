
import '../models/news.dart';
import '../services/firebase_service.dart';
import '../services/locator.dart';
import '../services/logging_service.dart';

class NewsRepository {
  final FirebaseService _firebaseService = locator<FirebaseService>();
  List<NewsModel> news = [];
  Future<List<NewsModel>> getNews() async {
    final res = await _firebaseService.fetchNews().onError((error, stackTrace) {
      throw error.toString();
    });
    news = res;
    return news;

  }

  // upload news
  Future<void> uploadNews(NewsModel news) async {
    await _firebaseService.uploadNews(news).onError((error, stackTrace) {
      locator<LoggingHelper>().error(error.toString());
      //throw error.toString();
    });
  }

}