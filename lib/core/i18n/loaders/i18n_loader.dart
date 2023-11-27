import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:work_calendar/core/i18n/repositories/translations_repository.dart';
import 'package:work_calendar/core/injection/injection.dart';

class I18nLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) {
    return getIt<TranslationRepository>().load(path, locale);
  }
}
