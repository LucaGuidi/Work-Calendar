import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';
import 'package:work_calendar/core/api/models/backend.dart';
import 'package:work_calendar/core/configuration/version.dart';

part 'configuration.g.dart';

@JsonSerializable()
class Configuration {
  final Backend backed;
  final Level? logLevel;
  final List<Version>? versioning;

  Configuration({
    required this.backed,
    this.logLevel,
    this.versioning,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) => _$ConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigurationToJson(this);
}