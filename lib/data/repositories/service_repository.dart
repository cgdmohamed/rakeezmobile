import 'package:dio/dio.dart';
import '../network/api_client.dart';

class ServiceRepository {
  final _dio = ApiClient.dio;

  Future<List<Map<String, dynamic>>> getAllServices() async {
    try {
      final response = await _dio.get('/admin/services');
      if (response.data['success'] == true) {
        return List<Map<String, dynamic>>.from(response.data['data']);
      }
      return [];
    } on DioException catch (e) {
      print('Service fetch error: ${e.response?.data}');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getServiceDetails(String id) async {
    try {
      final response = await _dio.get('/admin/services/$id');
      if (response.data['success'] == true) {
        return Map<String, dynamic>.from(response.data['data']);
      }
      return null;
    } catch (e) {
      print('Service detail error: $e');
      return null;
    }
  }
}
