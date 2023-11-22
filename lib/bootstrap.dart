import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:work_calendar/core/api/services/logger_service.dart';
import 'package:work_calendar/core/models/environment.dart';

Future<void> bootstrap(Environment env) async {
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
}
