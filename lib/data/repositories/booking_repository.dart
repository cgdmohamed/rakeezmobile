import 'package:dio/dio.dart';
import '../network/api_client.dart';
import '../network/api_error_handler.dart';

class BookingRepository with ApiErrorHandler {
  final _dio = ApiClient.dio;

  Future<Map<String, dynamic>?> createBooking(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/admin/bookings', data: data);
      if (response.data['success'] == true) {
        return Map<String, dynamic>.from(response.data['data']);
      }
      return null;
    } on DioException catch (e) {
      return handleApiError(e);
    }
  }

  Future<Map<String, dynamic>?> getBookingDetails(String id) async {
    try {
      final response = await _dio.get('/admin/bookings/$id');
      if (response.data['success'] == true) {
        return Map<String, dynamic>.from(response.data['data']);
      }
      return null;
    } on DioException catch (e) {
      return handleApiError(e);
    }
  }
}
