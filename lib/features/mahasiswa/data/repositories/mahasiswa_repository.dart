import 'dart:async';
import '../models/mahasiswa_model.dart';

class MahasiswaRepository {

  Future<List<MahasiswaModel>> getMahasiswaList() async {

    await Future.delayed(const Duration(seconds:1));

    return [

      MahasiswaModel(
        nama: "Budi Santoso",
        nim: "2201001",
        email: "budi@example.com",
        jurusan: "Teknik Informatika",
      ),

      MahasiswaModel(
        nama: "Siti Rahma",
        nim: "2201002",
        email: "siti@example.com",
        jurusan: "Teknik Informatika",
      ),

      MahasiswaModel(
        nama: "Andi Saputra",
        nim: "2201003",
        email: "andi@example.com",
        jurusan: "Teknik Informatika",
      ),
    ];
  }
}