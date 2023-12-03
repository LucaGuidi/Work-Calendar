// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      id: json['_id'] as String?,
      date: json['date'] as int?,
      year: json['year'] as int?,
      month: json['month'] as int?,
      day: json['day'] as int?,
      monthName: json['monthName'] as String?,
      dayName: json['dayName'] as String?,
      isHoliday: json['isHoliday'] as bool?,
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      '_id': instance.id,
      'date': instance.date,
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'monthName': instance.monthName,
      'dayName': instance.dayName,
      'isHoliday': instance.isHoliday,
    };
