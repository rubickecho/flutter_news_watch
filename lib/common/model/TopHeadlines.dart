import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_news_watch/common/model/Article.dart';

part 'TopHeadlines.g.dart';

@JsonSerializable()
class TopHeadlines {
	String status;
	int totalResults;
	List<Article> articles;

	TopHeadlines({this.status, this.totalResults, this.articles});

	factory TopHeadlines.fromJson(Map<String, dynamic> json) => _$TopHeadlinesFromJson(json);

	Map<String, dynamic> toJson() => _$TopHeadlinesToJson(this);

	TopHeadlines.empty();
}
