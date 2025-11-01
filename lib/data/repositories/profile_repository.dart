import 'package:dio/dio.dart';
import '../network/api_client.dart';

class ProfileRepository {
  final _dio = ApiClient.dio;

  Future<Map<String, dynamic>?> getProfile(String id) async {
    try {
      final res = await _dio.get('/admin/users/$id');
      if (res.data['success'] == true) return res.data['data'];
      return null;
    } catch (e) {
      print('Profile error: $e');
      return null;
    }
  }

  Future<bool> updateProfile(String id, Map<String, dynamic> data) async {
    try {
      final res = await _dio.put('/admin/users/$id', data: data);
      return res.data['success'] == true;
    } catch (e) {
      print('Update profile error: $e');
      return false;
    }
  }
}
