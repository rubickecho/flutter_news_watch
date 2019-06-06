import 'package:json_annotation/json_annotation.dart';

part 'ErrorEntity.g.dart';

@JsonSerializable()
class ErrorEntity {
	String status;
	String code;
	String message;

	ErrorEntity({this.status, this.code, this.message});

	factory ErrorEntity.fromJson(Map<String, dynamic> json) => _$ErrorEntityFromJson(json);

	Map<String, dynamic> toJson() => _$ErrorEntityToJson(this);

	ErrorEntity.empty();
}
