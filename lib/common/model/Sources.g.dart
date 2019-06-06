// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sources _$SourcesFromJson(Map<String, dynamic> json) {
  return Sources(
      status: json['status'] as String,
      sources: (json['sources'] as List)
          ?.map((e) =>
              e == null ? null : Source.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SourcesToJson(Sources instance) =>
    <String, dynamic>{'status': instance.status, 'sources': instance.sources};
