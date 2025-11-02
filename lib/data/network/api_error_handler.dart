import 'package:dio/dio.dart';

mixin ApiErrorHandler {
  T? handleApiError<T>(DioException e, [T? defaultValue]) {
    print('Api error: ${e.response?.data}');
    return defaultValue;
  }
}
