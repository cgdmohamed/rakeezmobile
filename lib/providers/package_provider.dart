import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repositories/package_repository.dart';

final packageRepositoryProvider = Provider((ref) => PackageRepository());

final packagesProvider = FutureProvider.autoDispose((ref) async {
  final repo = ref.read(packageRepositoryProvider);
  return await repo.getPackages();
});
