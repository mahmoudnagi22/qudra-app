import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioLoggerInterceptor extends Interceptor {
  const DioLoggerInterceptor();

  String _prettyJson(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(data);
    } catch (_) {
      return data.toString();
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('┌──────────────────────────────────────────────');
      debugPrint('│ ✅ REQUEST');
      debugPrint('│ ${options.method}  ${options.baseUrl}${options.path}');
      debugPrint('│ Headers: ${options.headers}');
      debugPrint('│ Query: ${options.queryParameters}');
      debugPrint('│ Body: ${_prettyJson(options.data)}');
      debugPrint('└──────────────────────────────────────────────');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('┌──────────────────────────────────────────────');
      debugPrint('│ ✅ RESPONSE');
      debugPrint('│ ${response.requestOptions.method}  ${response.requestOptions.baseUrl}${response.requestOptions.path}');
      debugPrint('│ Status: ${response.statusCode}');
      debugPrint('│ Data: ${_prettyJson(response.data)}');
      debugPrint('└──────────────────────────────────────────────');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('┌──────────────────────────────────────────────');
      debugPrint('│ ❌ ERROR');
      debugPrint('│ ${err.requestOptions.method}  ${err.requestOptions.baseUrl}${err.requestOptions.path}');
      debugPrint('│ Message: ${err.message}');
      debugPrint('│ Status: ${err.response?.statusCode}');
      debugPrint('│ Response: ${_prettyJson(err.response?.data)}');
      debugPrint('└──────────────────────────────────────────────');
    }
    handler.next(err);
  }
}
