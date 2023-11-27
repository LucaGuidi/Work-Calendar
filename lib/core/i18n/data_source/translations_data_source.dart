import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:work_calendar/core/data/data_source.dart';

abstract class TranslationDataSource implements DataSource {
  Future<Map<String, dynamic>> load(String path, Locale locale);

  String getLocalePath(String path, Locale locale) {
    final languageCode = getLanguageCode(locale);
    return '$path$languageCode.json';
  }

  String getLanguageCode(Locale locale) {
    final languageCode = locale.languageCode;
    final countryCode = locale.countryCode;
    return locale.countryCode == null ? languageCode : '${languageCode}_$countryCode';
  }
}

@Named('local')
@LazySingleton(as: TranslationDataSource)
class TranslationDataSourceImpl extends TranslationDataSource {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    final localPath = getLocalePath(path, locale);
    try {
      return jsonDecode(await rootBundle.loadString(localPath));
    } catch (_) {
      return {};
    }
  }
}
