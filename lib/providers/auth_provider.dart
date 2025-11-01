import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/auth_repository.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository());

final authStateProvider = StateNotifierProvider<AuthController, AsyncValue<bool>>((ref) {
  return AuthController(ref.read(authRepositoryProvider));
});

class AuthController extends StateNotifier<AsyncValue<bool>> {
  final AuthRepository _repo;
  AuthController(this._repo) : super(const AsyncData(false));

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    final success = await _repo.login(email, password);
    state = AsyncData(success);
  }

  Future<void> register(Map<String, dynamic> data) async {
    state = const AsyncLoading();
    final success = await _repo.register(data);
    state = AsyncData(success);
  }

  Future<void> verifyOtp(String code) async {
    state = const AsyncLoading();
    final success = await _repo.verifyOtp(code);
    state = AsyncData(success);
  }

  void logout() => _repo.logout();
}
