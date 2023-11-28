import 'package:json_annotation/json_annotation.dart';

part 'working_days_request.g.dart';

@JsonSerializable(createFactory: false)
class WorkingDaysRequest {
  WorkingDaysRequest({
    required this.initialDate,
    required this.finalDate,
    required this.nonWorkingDays,
  });

  final int initialDate;
  final int finalDate;
  final List<String> nonWorkingDays;

  Map<String, dynamic> toJson() => _$WorkingDaysRequestToJson(this);
}
