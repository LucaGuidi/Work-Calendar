import 'package:json_annotation/json_annotation.dart';

part 'day.g.dart';

@JsonSerializable()
class Day {
  @JsonKey(name: "_id")
  final String? id;
  final String? date;
  final int? year;
  final int? month;
  final int? day;
  final String? monthName;
  final String? dayName;
  final bool? isHoliday;

  const Day({
    this.id,
    this.date,
    this.year,
    this.month,
    this.day,
    this.monthName,
    this.dayName,
    this.isHoliday,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);
}
