// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Api _$ApiFromJson(Map<String, dynamic> json) => Api(
      name: json['name'] as String,
      url: json['url'] as String,
      method: json['method'] as String? ?? 'GET',
      headers: json['headers'] as Map<String, dynamic>? ?? {},
      contentType: json['contentType'] as String? ?? 'application/json',
    );

Map<String, dynamic> _$ApiToJson(Api instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'method': instance.method,
      'headers': instance.headers,
      'contentType': instance.contentType,
    };
