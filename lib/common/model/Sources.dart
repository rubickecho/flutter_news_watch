import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_news_watch/common/model/Source.dart';

part 'Sources.g.dart';

@JsonSerializable()
class Sources {
	String status;
	List<Source> sources;

	Sources({this.status, this.sources});

	factory Sources.fromJson(Map<String, dynamic> json) => _$SourcesFromJson(json);

	Map<String, dynamic> toJson() => _$SourcesToJson(this);

	Sources.empty();
}
