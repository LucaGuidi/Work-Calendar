import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

List<String> getDaysFromArray(List<bool> array, [Locale? locale]) {
  final List<String> days = [];
  if (array[0] == true) {
    locale != null ? days.add("MONDAY".tr()) : days.add("Monday");
  }
  if (array[1] == true) {
    locale != null ? days.add("TUESDAY".tr()) : days.add("Tuesday");
  }
  if (array[2] == true) {
    locale != null ? days.add("WEDNESDAY".tr()) : days.add("Wednesday");
  }
  if (array[3] == true) {
    locale != null ? days.add("THURSDAY".tr()) : days.add("Thursday");
  }
  if (array[4] == true) {
    locale != null ? days.add("FRIDAY".tr()) : days.add("Friday");
  }
  if (array[5] == true) {
    locale != null ? days.add("SATURDAY".tr()) : days.add("Saturday");
  }
  if (array[6] == true) {
    locale != null ? days.add("SUNDAY".tr()) : days.add("Sunday");
  }
  return days;
}
