import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:work_calendar/core/i18n/data_source/translations_data_source.dart';
import 'package:work_calendar/core/injection/injection.dart';

abstract class TranslationRepository {
  Future<Map<String, dynamic>> load(String path, Locale locale);
}

@LazySingleton(as: TranslationRepository)
class TranslationRepositoryImpl implements TranslationRepository {
  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    return await getIt<TranslationDataSource>(instanceName: 'local').load('assets/langs/', locale);
  }
}
