import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_news_watch/common/model/Source.dart';

part 'Article.g.dart';

@JsonSerializable()
class Article {
	Source source;
	String author;
	String title;
	String description;
	String url;
	String urlToImage;
	DateTime publishedAt;
	String content;

	Article({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

	factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

	Map<String, dynamic> toJson() => _$ArticleToJson(this);

	Article.empty();
}
