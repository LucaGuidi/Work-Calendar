import 'package:json_annotation/json_annotation.dart';

part 'version.g.dart';

enum VersionPlatform { iOS, android }

@JsonSerializable()
class Version {
  final VersionPlatform platform;
  final String lastVersion;
  final bool isMandatoryUpdate;
  final String storeLink;

  Version({
    required this.platform,
    required this.lastVersion,
    required this.isMandatoryUpdate,
    required this.storeLink,
  });

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);

  Map<String, dynamic> toJson() => _$VersionToJson(this);
}
