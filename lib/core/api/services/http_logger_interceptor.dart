import 'package:dio/dio.dart';
import 'package:work_calendar/core/api/services/logger_service.dart';

class HttpLoggerInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    LoggerService.d('### REQUEST ###\nmethod: ${options.method}\ndata: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    LoggerService.d('### RESPONSE ###\nResponse Text: ${response.data}');
    super.onResponse(response, handler);
  }
}