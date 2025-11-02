import 'package:dio/dio.dart';
import '../network/api_client.dart';
import '../network/api_error_handler.dart';

class ProfileRepository with ApiErrorHandler {
  final _dio = ApiClient.dio;

  Future<Map<String, dynamic>?> getProfile(String id) async {
    try {
      final res = await _dio.get('/admin/users/$id');
      if (res.data['success'] == true) return res.data['data'];
      return null;
    } on DioException catch (e) {
      return handleApiError(e);
    }
  }

  Future<bool> updateProfile(String id, Map<String, dynamic> data) async {
    try {
      final res = await _dio.put('/admin/users/$id', data: data);
      return res.data['success'] == true;
    } on DioException catch (e) {
      return handleApiError(e, false) ?? false;
    }
  }
}
