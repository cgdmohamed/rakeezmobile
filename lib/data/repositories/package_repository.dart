import 'package:dio/dio.dart';
import '../network/api_client.dart';
import '../network/api_error_handler.dart';

class PackageRepository with ApiErrorHandler {
  final _dio = ApiClient.dio;

  Future<List<Map<String, dynamic>>> getPackages() async {
    try {
      final response = await _dio.get('/admin/subscription-packages');
      if (response.data['success'] == true) {
        return List<Map<String, dynamic>>.from(response.data['data']);
      }
      return [];
    } on DioException catch (e) {
      return handleApiError(e, []) ?? [];
    }
  }
}
