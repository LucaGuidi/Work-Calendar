import 'package:easy_localization/easy_localization.dart';

String getFormattedDateTime(DateTime? date) {
  if (date != null) {
    return DateFormat('d MMM yyyy').format(date);
  }
  return '';
}
