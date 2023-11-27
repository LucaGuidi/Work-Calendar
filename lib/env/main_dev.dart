import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:work_calendar/bootstrap.dart';
import 'package:work_calendar/core/configuration/local_config_dev.dart';
import 'package:work_calendar/core/i18n/loaders/i18n_loader.dart';
import 'package:work_calendar/core/models/environment.dart';
import 'package:work_calendar/core/models/locale_env.dart';
import 'package:work_calendar/presentation/init/app.dart';

Future<void> main() async {
  final env = Environment(
    appName: 'Work Calendar [DEV]',
    config: localConfigDev,
    baseUrl: 'localhost/3000',
    devMode: true,
    env: Environments.dev,
    logLevel: Level.debug,
    locale: LocaleEnv(
      path: 'assets/langs/',
      loader: I18nLoader(),
      supported: const [
        Locale('en'),
        Locale('it'),
      ],
      fallback: const Locale('it'),
    ),
    child: const App(),
  );
  await bootstrap(env);
}
