// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TopHeadlines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopHeadlines _$TopHeadlinesFromJson(Map<String, dynamic> json) {
  return TopHeadlines(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: (json['articles'] as List)
          ?.map((e) =>
              e == null ? null : Article.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TopHeadlinesToJson(TopHeadlines instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles
    };
