// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Version _$VersionFromJson(Map<String, dynamic> json) => Version(
      platform: $enumDecode(_$VersionPlatformEnumMap, json['platform']),
      lastVersion: json['lastVersion'] as String,
      isMandatoryUpdate: json['isMandatoryUpdate'] as bool,
      storeLink: json['storeLink'] as String,
    );

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'platform': _$VersionPlatformEnumMap[instance.platform]!,
      'lastVersion': instance.lastVersion,
      'isMandatoryUpdate': instance.isMandatoryUpdate,
      'storeLink': instance.storeLink,
    };

const _$VersionPlatformEnumMap = {
  VersionPlatform.iOS: 'iOS',
  VersionPlatform.android: 'android',
};
