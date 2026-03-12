import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {

  Future<List<MahasiswaAktifModel>> getMahasiswaAktif() async {

    await Future.delayed(const Duration(seconds: 1));

    return [

      MahasiswaAktifModel(
        nama: "Budi Santoso",
        nim: "2201001",
        jurusan: "Teknik Informatika",
      ),

      MahasiswaAktifModel(
        nama: "Siti Rahma",
        nim: "2201002",
        jurusan: "Teknik Informatika",
      ),

      MahasiswaAktifModel(
        nama: "Andi Saputra",
        nim: "2201003",
        jurusan: "Teknik Informatika",
      ),

    ];
  }
}