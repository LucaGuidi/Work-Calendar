List<String> getDaysFromArray(List<bool> array) {
  final List<String> days = [];
  if (array[0] == true) {
    days.add("Monday");
  }
  if (array[1] == true) {
    days.add("Tuesday");
  }
  if (array[2] == true) {
    days.add("Wednesday");
  }
  if (array[3] == true) {
    days.add("Thursday");
  }
  if (array[4] == true) {
    days.add("Friday");
  }
  if (array[5] == true) {
    days.add("Saturday");
  }
  if (array[6] == true) {
    days.add("Sunday");
  }

  return days;
}
