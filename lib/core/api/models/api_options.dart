import 'package:dio/dio.dart';

class ApiOptions {
  final Map<String, dynamic> query;
  final Map<String, dynamic> rest;
  final dynamic body;
  final Map<String, dynamic> headers;
  final ResponseType responseType;
  final CancelToken? cancelToken;

  const ApiOptions({
    this.query = const {},
    this.rest = const {},
    this.body,
    this.headers = const {},
    this.responseType = ResponseType.json,
    this.cancelToken,
  });
}
