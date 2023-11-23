import 'package:json_annotation/json_annotation.dart';

part 'day.g.dart';

@JsonSerializable()
class Day {
  final String? date;
  final int? year;
  final int? month;
  final int? day;
  final String? monthName;
  final String? dayName;
  final String? holidayString;

  bool? get isHoliday => bool.tryParse(holidayString ?? '');

  const Day({
    this.date,
    this.year,
    this.month,
    this.day,
    this.monthName,
    this.dayName,
    this.holidayString,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
