import 'package:flutter/material.dart';
import '../../data/models/mahasiswa_model.dart';

class MahasiswaListView extends StatelessWidget {

  final List<MahasiswaModel> mahasiswaList;
  final VoidCallback onRefresh;

  const MahasiswaListView({
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

            child: Padding(

              padding: const EdgeInsets.all(16),

              child: Row(

                children: [

                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.blue.shade100,
                    child: const Icon(
                      Icons.person,
                      color: Colors.blue,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width:16),

                  Expanded(

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(
                          mhs.nama,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height:4),

                        Text(
                          "NIM : ${mhs.nim}",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),

                        Text(
                          mhs.email,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),

                        const SizedBox(height:4),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal:10,
                            vertical:4,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Text(
                            mhs.jurusan,
                            style: const TextStyle(
                              fontSize:12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_ios,
                    size:18,
                    color: Colors.grey,
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}