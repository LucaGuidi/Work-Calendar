// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Backend _$BackendFromJson(Map<String, dynamic> json) => Backend(
      api: (json['api'] as List<dynamic>)
          .map((e) => Api.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseUrl: json['baseUrl'] as String? ?? '',
      connectTimeout: json['connectTimeout'] == null
          ? null
          : Duration(microseconds: json['connectTimeout'] as int),
    );

Map<String, dynamic> _$BackendToJson(Backend instance) => <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'connectTimeout': instance.connectTimeout?.inMicroseconds,
      'api': instance.api,
    };
