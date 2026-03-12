import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/mahasiswa_model.dart';
import '../../data/repositories/mahasiswa_repository.dart';

final mahasiswaRepositoryProvider =
Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

class MahasiswaNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {

  final MahasiswaRepository repository;

  MahasiswaNotifier(this.repository)
      : super(const AsyncValue.loading()) {
    loadMahasiswa();
  }

  Future<void> loadMahasiswa() async {

    try {

      final data = await repository.getMahasiswaList();

      state = AsyncValue.data(data);

    } catch (e, stack) {

      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> refresh() async {
    await loadMahasiswa();
  }
}

final mahasiswaNotifierProvider =
StateNotifierProvider.autoDispose<
    MahasiswaNotifier,
    AsyncValue<List<MahasiswaModel>>>((ref) {

  final repo = ref.watch(mahasiswaRepositoryProvider);

  return MahasiswaNotifier(repo);
});