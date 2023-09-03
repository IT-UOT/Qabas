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
  Future<void> createPost(NewsModel news) async {
    await _firebaseService.createPost(news).onError((error, stackTrace) {
      locator<LoggingHelper>().error(error.toString());
      
      throw error.toString();
    });
  }

  Future<void> updatePost(NewsModel news) async {
    await _firebaseService.updatePost(news).onError((error, stackTrace) {
      locator<LoggingHelper>().error(error.toString());
      //throw error.toString();
    });
  }

  Future<void> deletePost(String postId) async {
    await _firebaseService.deletePost(postId).onError((error, stackTrace) {
      locator<LoggingHelper>().error(error.toString());
      //throw error.toString();
    });
  }
}
