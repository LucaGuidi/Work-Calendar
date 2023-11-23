// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      date: json['date'] as String?,
      year: json['year'] as int?,
      month: json['month'] as int?,
      day: json['day'] as int?,
      monthName: json['monthName'] as String?,
      dayName: json['dayName'] as String?,
      holidayString: json['holidayString'] as String?,
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'date': instance.date,
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'monthName': instance.monthName,
      'dayName': instance.dayName,
      'holidayString': instance.holidayString,
    };
