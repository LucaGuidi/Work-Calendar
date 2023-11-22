import 'package:logger/logger.dart';

class LoggerService {
  static Logger _instance = Logger();

  static init({
    LogPrinter? printer,
    LogOutput? output,
    Level? level,
    LogFilter? filter,
  }) {
    _instance = Logger(
      printer: printer,
      output: output,
      level: level,
      filter: filter,
    );
  }

  /// Logga un messaggio a livello [Level.trace]
  static void t(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _instance.t(message, error: error, stackTrace: stackTrace);

  /// Logga un messaggio a livello [Level.debug]
  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _instance.d(message, error: error, stackTrace: stackTrace);

  /// Logga un messaggio a livello [Level.info]
  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _instance.i(message, error: error, stackTrace: stackTrace);

  /// Logga un messaggio a livello [Level.warning]
  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _instance.w(message, error: error, stackTrace: stackTrace);

  /// Logga un messaggio a livello [Level.error]
  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _instance.e(message, error: error, stackTrace: stackTrace);

  /// Logga un messaggio a livello [Level.fatal]
  static void f(dynamic message, [dynamic error, StackTrace? stackTrace]) =>
      _instance.f(message, error: error, stackTrace: stackTrace);
}
