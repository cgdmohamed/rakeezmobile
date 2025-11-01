import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/service_repository.dart';

final serviceRepositoryProvider = Provider((ref) => ServiceRepository());

final servicesProvider = FutureProvider.autoDispose((ref) async {
  final repo = ref.read(serviceRepositoryProvider);
  return await repo.getAllServices();
});
