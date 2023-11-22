import 'package:json_annotation/json_annotation.dart';
import 'package:work_calendar/core/api/models/api.dart';
import 'package:collection/collection.dart';

part 'backend.g.dart';

@JsonSerializable()
class Backend {
  Backend({
    required this.api,
    this.baseUrl = '',
    this.connectTimeout,
  });

  String baseUrl;
  Duration? connectTimeout;
  final List<Api> api;

  Api? getApi(String apiName) => api.firstWhereOrNull((a) => a.name == apiName);

  factory Backend.fromJson(Map<String, dynamic> json) => _$BackendFromJson(json);

  Map<String, dynamic> toJson() => _$BackendToJson(this);
}
