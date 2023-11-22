import 'package:json_annotation/json_annotation.dart';
import 'package:work_calendar/core/api/models/request_method.dart';

part 'api.g.dart';

@JsonSerializable()
class Api {
  final String name;
  final String url;
  @JsonKey(defaultValue: RequestMethod.GET)
  final String method;
  @JsonKey(defaultValue: 30000, includeFromJson: false, includeToJson: false)
  final Duration timeout;
  @JsonKey(defaultValue: {})
  final Map<String, dynamic> headers;
  @JsonKey(defaultValue: 'application/json')
  final String contentType;

  Api({
    required this.name,
    required this.url,
    this.method = RequestMethod.GET,
    this.timeout = const Duration(milliseconds: 30000),
    this.headers = const {},
    this.contentType = 'application/json',
  });

  Api copyWith({
    String? name,
    String? url,
    String? method,
    Duration? timeout,
    Map<String, dynamic>? headers,
    String? contentType,
  }) {
    return Api(
      name: name ?? this.name,
      url: url ?? this.url,
      method: method ?? this.method,
      timeout: timeout ?? this.timeout,
      headers: headers ?? this.headers,
      contentType: contentType ?? this.contentType,
    );
  }

  factory Api.fromJson(Map<String, dynamic> json) => _$ApiFromJson(json);

  Map<String, dynamic> toJson() => _$ApiToJson(this);
}
