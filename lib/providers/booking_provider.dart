import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/booking_repository.dart';

final bookingRepositoryProvider = Provider((ref) => BookingRepository());

final bookingStateProvider = StateNotifierProvider<BookingController, AsyncValue<Map<String, dynamic>?>>((ref) {
  return BookingController(ref.read(bookingRepositoryProvider));
});

class BookingController extends StateNotifier<AsyncValue<Map<String, dynamic>?>> {
  final BookingRepository _repo;
  BookingController(this._repo) : super(const AsyncData(null));

  Future<void> createBooking(Map<String, dynamic> data) async {
    state = const AsyncLoading();
    final result = await _repo.createBooking(data);
    state = AsyncData(result);
  }
}
