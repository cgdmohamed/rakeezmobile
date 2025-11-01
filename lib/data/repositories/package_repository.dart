import 'package:dio/dio.dart';
import '../network/api_client.dart';

class PackageRepository {
  final _dio = ApiClient.dio;

  Future<List<Map<String, dynamic>>> getPackages() async {
    try {
      final response = await _dio.get('/admin/subscription-packages');
      if (response.data['success'] == true) {
        return List<Map<String, dynamic>>.from(response.data['data']);
      }
      return [];
    } catch (e) {
      print('Package fetch error: $e');
      return [];
    }
  }
}
