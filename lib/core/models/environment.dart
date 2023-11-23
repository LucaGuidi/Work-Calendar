import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:work_calendar/core/configuration/configuration.dart';
import 'package:work_calendar/core/models/locale_env.dart';

enum Environments { dev, prod }

class Environment extends InheritedWidget {
  const Environment({
    this.env,
    this.config,
    this.appName,
    this.locale,
    this.devMode,
    this.logLevel,
    this.baseUrl,
    super.key,
    required super.child,
  });

  final Environments? env;
  final Configuration? config;
  final String? appName;
  final LocaleEnv? locale;
  final bool? devMode;
  final Level? logLevel;
  final String? baseUrl;

  static Environment? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
