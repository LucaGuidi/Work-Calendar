// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) =>
    Configuration(
      backed: Backend.fromJson(json['backed'] as Map<String, dynamic>),
      logLevel: $enumDecodeNullable(_$LevelEnumMap, json['logLevel']),
      versioning: (json['versioning'] as List<dynamic>?)
          ?.map((e) => Version.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConfigurationToJson(Configuration instance) =>
    <String, dynamic>{
      'backed': instance.backed,
      'logLevel': _$LevelEnumMap[instance.logLevel],
      'versioning': instance.versioning,
    };

const _$LevelEnumMap = {
  Level.all: 'all',
  Level.verbose: 'verbose',
  Level.trace: 'trace',
  Level.debug: 'debug',
  Level.info: 'info',
  Level.warning: 'warning',
  Level.error: 'error',
  Level.wtf: 'wtf',
  Level.fatal: 'fatal',
  Level.nothing: 'nothing',
  Level.off: 'off',
};
