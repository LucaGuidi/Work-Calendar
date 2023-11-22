import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:injectable/injectable.dart';
import 'package:work_calendar/core/api/models/api.dart';
import 'package:work_calendar/core/api/models/api_options.dart';
import 'package:work_calendar/core/api/models/backend.dart';
import 'package:work_calendar/core/errors/models/failure.dart';

@lazySingleton
class ApiService {
  static const _defaultDioInstance = 'default';
  final Map<String, Dio> _clients = {};
  Backend? _backend;
  bool get isReady => _backend != null;
  void init(Backend? backend) {
    if (backend == null) {
      throw const Failure('MISSING_BACKEND_CONFIGURATION');
    }
    _backend = backend;

    _createDioInstance(_defaultDioInstance);
  }

  void _createDioInstance(String name) {
    if (_backend != null) {
      _clients[name] = Dio();
    }
  }

  void addProxy(
    String proxyIp, {
    String clientName = _defaultDioInstance,
  }) {
    final proxy = Platform.isAndroid ? '$proxyIp:8888' : 'localhost:8888';
    (_clients[clientName]?.httpClientAdapter as IOHttpClientAdapter?)
        ?.createHttpClient = () {
      final client = HttpClient();
      client.findProxy = (url) => 'PROXY $proxy';
      client.badCertificateCallback = (cert, host, port) => Platform.isAndroid;
      return client;
    };
  }

  void addInterceptorWithCallback(
    void Function(Dio) registrationCallback, {
    String clientName = _defaultDioInstance,
  }) {
    final dio = _clients[clientName]!;
    registrationCallback(dio);
  }

  void addInterceptor(
    Interceptor interceptor, {
    String clientName = _defaultDioInstance,
  }) {
    _clients[clientName]?.interceptors.add(interceptor);
  }

  Future<Response> callApi(
    String apiName, {
    String clientName = _defaultDioInstance,
    ApiOptions options = const ApiOptions(),
  }) {
    final api = _backend?.getApi(apiName);
    if (api == null) {
      throw Exception('No api $apiName found');
    }
    final requestOptions = _prepareOptions(api, options);
    return call(clientName, requestOptions);
  }

  Future<Response> call(
    String clientName,
    RequestOptions options,
  ) async {
    final client = _clients[clientName];
    if (client == null) {
      throw Exception('No client $clientName found');
    }
    return client.fetch(options);
  }

  RequestOptions _prepareOptions(
    Api api,
    ApiOptions options,
  ) {
    return RequestOptions(
      baseUrl: _backend!.baseUrl,
      path: _prepareUrl(api.url, options.rest),
      cancelToken: options.cancelToken,
      connectTimeout: _backend!.connectTimeout,
      sendTimeout: api.timeout,
      receiveTimeout: api.timeout,
      data: options.body,
      method: api.method,
      queryParameters: options.query,
      responseType: options.responseType,
      headers: {
        if (options.headers.isNotEmpty) ...options.headers,
      },
    );
  }

  String _prepareUrl(
    String url,
    Map<String, dynamic>? rest,
  ) {
    var preparedUrl = url;
    if (rest != null && rest.isNotEmpty) {
      rest.forEach((key, value) {
        preparedUrl =
            preparedUrl.replaceAll(RegExp('{$key}'), value.toString());
      });
    }
    return preparedUrl;
  }
}
