import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/profile_model.dart';
import '../../data/repositories/profile_repository.dart';

final profileRepositoryProvider =
Provider<ProfileRepository>((ref){
  return ProfileRepository();
});

class ProfileNotifier
    extends StateNotifier<AsyncValue<ProfileModel>> {

  final ProfileRepository repository;

  ProfileNotifier(this.repository)
      : super(const AsyncValue.loading()){
    loadProfile();
  }

  Future<void> loadProfile() async{

    try{

      final data = await repository.getProfile();

      state = AsyncValue.data(data);

    }catch(e,stack){

      state = AsyncValue.error(e,stack);

    }

  }

  Future<void> refresh() async{
    await loadProfile();
  }

}

final profileNotifierProvider =
StateNotifierProvider.autoDispose<
    ProfileNotifier,
    AsyncValue<ProfileModel>
>((ref){

  final repo = ref.watch(profileRepositoryProvider);

  return ProfileNotifier(repo);

});