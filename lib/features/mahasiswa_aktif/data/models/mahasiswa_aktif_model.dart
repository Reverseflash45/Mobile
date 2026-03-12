class MahasiswaAktifModel {

  final String nama;
  final String nim;
  final String jurusan;

  MahasiswaAktifModel({
    required this.nama,
    required this.nim,
    required this.jurusan,
  });

  factory MahasiswaAktifModel.fromJson(Map<String,dynamic> json){

    return MahasiswaAktifModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      jurusan: json['jurusan'] ?? '',
    );
  }

}