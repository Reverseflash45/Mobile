import 'package:flutter/material.dart';
import '../../data/models/profile_model.dart';

class ProfileView extends StatelessWidget {

  final ProfileModel profile;
  final VoidCallback onRefresh;

  const ProfileView({
    super.key,
    required this.profile,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(

      onRefresh: () async {
        onRefresh();
      },

      child: ListView(

        padding: const EdgeInsets.all(24),

        children: [

          const SizedBox(height:20),

          const CircleAvatar(
            radius:60,
            child: Icon(Icons.person,size:60),
          ),

          const SizedBox(height:20),

          Center(
            child: Text(
              profile.nama,
              style: const TextStyle(
                fontSize:22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height:6),

          Center(
            child: Text(profile.nim),
          ),

          const SizedBox(height:30),

          Card(
            child: ListTile(
              leading: const Icon(Icons.email),
              title: Text(profile.email),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.school),
              title: Text(profile.jurusan),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.apartment),
              title: Text(profile.fakultas),
            ),
          ),

        ],
      ),
    );
  }
}