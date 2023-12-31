import 'package:dio/dio.dart';
import 'package:work_calendar/core/api/services/logger_service.dart';

class ApiInterceptor extends QueuedInterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final baseUrl = options.baseUrl;
    final path = options.path;
    LoggerService.d('### BASE URL: $baseUrl\n### ENDPOINT: $path');
    super.onRequest(options, handler);
  }
}