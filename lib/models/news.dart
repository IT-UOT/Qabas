import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

@freezed
class NewsModel with _$NewsModel{
  const factory NewsModel({
    required String title,
    required String content,
    required String publishedAt,
     bool? isPinned,
     String? author,
     String? imageUrl,
     String? url,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json)  => _$NewsModelFromJson(json);
}