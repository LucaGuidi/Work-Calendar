import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:work_calendar/core/models/environment.dart' as app;

import 'injection.config.dart';

final getIt = GetIt.I;

@injectableInit
void configureDependenciesForEnvironment(app.Environment env) {
  getIt.registerSingleton(env);
  getIt.init();
}

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}