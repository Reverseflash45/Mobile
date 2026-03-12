class ProfileModel {

  final String nama;
  final String nim;
  final String email;
  final String jurusan;
  final String fakultas;

  ProfileModel({
    required this.nama,
    required this.nim,
    required this.email,
    required this.jurusan,
    required this.fakultas,
  });

  factory ProfileModel.fromJson(Map<String,dynamic> json){

    return ProfileModel(
      nama: json['nama'] ?? '',
      nim: json['nim'] ?? '',
      email: json['email'] ?? '',
      jurusan: json['jurusan'] ?? '',
      fakultas: json['fakultas'] ?? '',
    );
  }

}