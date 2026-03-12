import '../models/profile_model.dart';

class ProfileRepository {

  Future<ProfileModel> getProfile() async {

    await Future.delayed(const Duration(seconds:1));

    return ProfileModel(
      nama: "Rafi Fernandito",
      nim: "434241117",
      email: "rffernanditoo@gmail.com",
      jurusan: "D4 Teknik Informatika",
      fakultas: "Fakultas Vokasi",
    );

  }

}