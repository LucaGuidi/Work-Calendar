import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:work_calendar/core/api/services/api_interceptor.dart';
import 'package:work_calendar/core/api/services/api_service.dart';
import 'package:work_calendar/core/api/services/htto_logger_interceptor.dart';
import 'package:work_calendar/core/api/services/logger_service.dart';
import 'package:work_calendar/core/api/services/throttling_interceptor.dart';
import 'package:work_calendar/core/injection/injection.dart';
import 'package:work_calendar/core/models/environment.dart';

Future<void> bootstrap(Environment env) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();

  configureDependenciesForEnvironment(env);

  LoggerService.init(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
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
    ..addInterceptor(HttpLoggerInterceptor());

  runApp(env);
}
