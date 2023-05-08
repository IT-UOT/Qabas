// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewsModel _$$_NewsModelFromJson(Map<String, dynamic> json) => _$_NewsModel(
      title: json['title'] as String,
      content: json['content'] as String,
      publishedAt: json['publishedAt'] as String,
      isPinned: json['isPinned'] as bool?,
      author: json['author'] as String?,
      imageUrl: json['imageUrl'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$_NewsModelToJson(_$_NewsModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'publishedAt': instance.publishedAt,
      'isPinned': instance.isPinned,
      'author': instance.author,
      'imageUrl': instance.imageUrl,
      'url': instance.url,
    };
