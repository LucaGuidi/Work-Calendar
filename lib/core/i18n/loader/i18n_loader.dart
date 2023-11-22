import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';

class I18nLoader extends AssetLoader {
  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    throw UnimplementedError();
  }
}
