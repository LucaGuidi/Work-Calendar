import 'package:json_annotation/json_annotation.dart';

part 'working_days_request.g.dart';

@JsonSerializable(createFactory: false)
class WorkingDaysRequest {
  WorkingDaysRequest({
    required this.initialDate,
    required this.finalDate,
  });

  final int initialDate;
  final int finalDate;

  Map<String, dynamic> toJson() => _$WorkingDaysRequestToJson(this);
}
