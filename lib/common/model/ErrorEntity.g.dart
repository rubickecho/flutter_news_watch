// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ErrorEntity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorEntity _$ErrorEntityFromJson(Map<String, dynamic> json) {
  return ErrorEntity(
      status: json['status'] as String,
      code: json['code'] as String,
      message: json['message'] as String);
}

Map<String, dynamic> _$ErrorEntityToJson(ErrorEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message
    };
