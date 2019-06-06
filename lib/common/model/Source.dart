import 'package:json_annotation/json_annotation.dart';

part 'Source.g.dart';

@JsonSerializable()
class Source {
	String id;
	String name;
	String description;
	String url;
	String category;
	String language;
	String country;

	Source({this.id, this.name, this.description, this.url, this.category, this.language, this.country});

	factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

	Map<String, dynamic> toJson() => _$SourceToJson(this);

	Source.empty();
}
