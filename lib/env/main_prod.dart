import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:work_calendar/bootstrap.dart';
import 'package:work_calendar/core/configuration/local_config_dev.dart';
import 'package:work_calendar/core/i18n/loader/i18n_loader.dart';
import 'package:work_calendar/core/models/environment.dart';
import 'package:work_calendar/core/models/locale_env.dart';
import 'package:work_calendar/presentation/init/app.dart';

Future<void> main() async {
  final env = Environment(
    appName: 'Work Calendar',
    config: localConfigDev, //TODO
    baseUrl: '',
    devMode: false,
    env: Environments.prod,
    logLevel: Level.debug,
    locale: LocaleEnv(
      path: 'assets/langs/',
      loader: I18nLoader(),
      supported: const [
        Locale('en_GB'),
        Locale('it_IT'),
      ],
      fallback: const Locale('it_IT'),
    ),
    child: App(),
  );
  await bootstrap(env);
}
