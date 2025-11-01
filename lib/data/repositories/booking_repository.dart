import 'package:dio/dio.dart';
import '../network/api_client.dart';

class BookingRepository {
  final _dio = ApiClient.dio;

  Future<Map<String, dynamic>?> createBooking(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/admin/bookings', data: data);
      if (response.data['success'] == true) {
        return Map<String, dynamic>.from(response.data['data']);
      }
      return null;
    } catch (e) {
      print('Booking create error: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> getBookingDetails(String id) async {
    try {
      final response = await _dio.get('/admin/bookings/$id');
      if (response.data['success'] == true) {
        return Map<String, dynamic>.from(response.data['data']);
      }
      return null;
    } catch (e) {
      print('Booking detail error: $e');
      return null;
    }
  }
}
