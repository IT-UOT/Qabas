import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:itmentor/data/news_repository.dart';
import 'package:itmentor/services/locator.dart';

import '../../models/news.dart';
import '../../services/logging_service.dart';

part 'news_state.dart';
part 'news_cubit.freezed.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _newsRepository = NewsRepository();
  NewsCubit() : super(const NewsState.initial()) {
    loadNews();
  }

  // fetch all news
  Future<void> loadNews() async {
    emit(const NewsState.loading());
    try {
      final news = await _newsRepository.getNews();
      emit(NewsState.loaded(news));
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      emit(NewsState.error(e.toString()));
    }
  }

  // upload news
  Future<void> createPost(NewsModel news) async {
    emit(const NewsState.loading());
    try {
      await _newsRepository.createPost(news);
      loadNews();
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      emit(NewsState.error(e.toString()));
    }
  }

  // update news
  Future<void> updatePost(NewsModel news) async {
    emit(const NewsState.loading());
    try {
      await _newsRepository.updatePost(news);
      loadNews();
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      emit(NewsState.error(e.toString()));
    }
  }

  // delete news
  Future<void> deletePost(String postId) async {
    emit(const NewsState.loading());
    try {
      await _newsRepository.deletePost(postId);
      loadNews();
    } catch (e) {
      locator<LoggingHelper>().error(e.toString());
      emit(NewsState.error(e.toString()));
    }
  }
}
