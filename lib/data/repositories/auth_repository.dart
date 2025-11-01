import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../network/api_client.dart';
import '../network/endpoints.dart';

class AuthRepository {
  final _dio = ApiClient.dio;
  final _storage = const FlutterSecureStorage();

  /// تسجيل الدخول باستخدام identifier (email أو phone)
  Future<bool> login(String identifier, String password) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: {
          'identifier': identifier,
          'password': password,
          'language': 'en',
        },
      );

      if (response.data['success'] == true) {
        final data = response.data['data'];
        await _storage.write(key: 'access_token', value: data['access_token']);
        await _storage.write(key: 'refresh_token', value: data['refresh_token']);
        await _storage.write(key: 'user_id', value: data['user']['id']);
        await _storage.write(key: 'user_email', value: data['user']['email']);
        await _storage.write(key: 'user_name', value: data['user']['name']);
        return true;
      }

      return false;
    } on DioException catch (e) {
      print('Login error: ${e.response?.data}');
      return false;
    }
  }

  /// التسجيل (Admin API - create user)
  Future<bool> register(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(ApiEndpoints.register, data: data);
      return response.data['success'] == true;
    } catch (e) {
      print('Register error: $e');
      return false;
    }
  }

  /// تحقق OTP (لو موجود في API)
  Future<bool> verifyOtp(String code) async {
    try {
      final response = await _dio.post(ApiEndpoints.verifyOtp, data: {'code': code});
      return response.data['success'] == true;
    } catch (e) {
      print('Verify error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    await _storage.deleteAll();
  }
}
