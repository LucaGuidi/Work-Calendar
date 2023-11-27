import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:work_calendar/core/api/services/api_interceptor.dart';
import 'package:work_calendar/core/api/services/api_service.dart';
import 'package:work_calendar/core/api/services/logger_service.dart';
import 'package:work_calendar/core/api/services/throttling_interceptor.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/core/models/environment.dart';

Future<void> bootstrap(Environment env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  
  configureDependenciesForEnvironment(env);

  LoggerService.init(
    printer: SimplePrinter(printTime: true),
    level: (env.logLevel ?? Level.info),
    filter: (env.devMode ?? true) ? ProductionFilter() : DevelopmentFilter(),
    output: MultiOutput([
      if (kDebugMode) ConsoleOutput(),
      FileOutput(
        file: File(
          '${(await getApplicationSupportDirectory()).path}/log.txt',
        ),
      )
    ]),
  );

  getIt<ApiService>()
    ..init(env.config!.backed)
    ..addInterceptor(ThrottlingInterceptor(period: const Duration(microseconds: 8000000), limit: 10))
    ..addInterceptor(ApiInterceptor())
    ..addInterceptor(LogInterceptor(
      responseBody: true,
      requestBody: true,
      logPrint: LoggerService.d,
    ));

  runApp(env);
}
