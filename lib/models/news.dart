import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class NewsModel with _$NewsModel{
  const factory NewsModel({
    required String id,
    required String title,
    required String content,
    required DateTime publishedAt,
     bool? isPinned,
     String? author,
     String? imageUrl,
     String? url,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json)  => _$NewsModelFromJson(json);
}