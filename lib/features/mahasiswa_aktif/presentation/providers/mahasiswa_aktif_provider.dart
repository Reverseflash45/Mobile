import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/mahasiswa_aktif_model.dart';
import '../../data/repositories/mahasiswa_aktif_repository.dart';

final mahasiswaAktifRepositoryProvider =
Provider<MahasiswaAktifRepository>((ref) {
  return MahasiswaAktifRepository();
});

class MahasiswaAktifNotifier
    extends StateNotifier<AsyncValue<List<MahasiswaAktifModel>>> {

  final MahasiswaAktifRepository repository;

  MahasiswaAktifNotifier(this.repository)
      : super(const AsyncValue.loading()) {
    loadMahasiswaAktif();
  }

  Future<void> loadMahasiswaAktif() async {

    try {

      final data = await repository.getMahasiswaAktif();

      state = AsyncValue.data(data);

    } catch (e, stack) {

      state = AsyncValue.error(e, stack);

    }
  }

  Future<void> refresh() async {
    await loadMahasiswaAktif();
  }
}

final mahasiswaAktifNotifierProvider =
StateNotifierProvider.autoDispose<
    MahasiswaAktifNotifier,
    AsyncValue<List<MahasiswaAktifModel>>>((ref) {

  final repo = ref.watch(mahasiswaAktifRepositoryProvider);

  return MahasiswaAktifNotifier(repo);

});