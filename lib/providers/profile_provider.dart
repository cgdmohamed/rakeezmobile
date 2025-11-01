import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/profile_repository.dart';

final profileRepositoryProvider = Provider((ref) => ProfileRepository());

final profileProvider = FutureProvider.family<Map<String, dynamic>?, String>((ref, id) async {
  final repo = ref.read(profileRepositoryProvider);
  return await repo.getProfile(id);
});
