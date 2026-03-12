import 'package:flutter/material.dart';
import '../../data/models/mahasiswa_aktif_model.dart';

class MahasiswaAktifListView extends StatelessWidget {

  final List<MahasiswaAktifModel> mahasiswaList;
  final VoidCallback onRefresh;

  const MahasiswaAktifListView({
    super.key,
    required this.mahasiswaList,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(

      onRefresh: () async {
        onRefresh();
      },

      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mahasiswaList.length,

        itemBuilder: (context,index){

          final mhs = mahasiswaList[index];

          return Card(

            elevation: 4,
            margin: const EdgeInsets.only(bottom:16),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            child: ListTile(

              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: const Icon(Icons.school,color: Colors.green),
              ),

              title: Text(mhs.nama),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NIM : ${mhs.nim}"),
                  Text(mhs.jurusan),
                ],
              ),

              trailing: const Icon(Icons.check_circle,color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}