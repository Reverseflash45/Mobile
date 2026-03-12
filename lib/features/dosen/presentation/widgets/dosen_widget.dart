import 'package:flutter/material.dart';
import 'package:d4tivokasi/features/dosen/data/models/dosen_model.dart';

class DosenListView extends StatelessWidget {

  final List<DosenModel> dosenList;
  final VoidCallback onRefresh;
  final bool useModernCard;

  const DosenListView({
    super.key,
    required this.dosenList,
    required this.onRefresh,
    this.useModernCard = true,
  });

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: () async {
        onRefresh();
      },

      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dosenList.length,

        itemBuilder: (context, index) {

          final dosen = dosenList[index];

          final gradients = [
            [const Color(0xFF667eea), const Color(0xFF764ba2)],
            [const Color(0xFFFF758c), const Color(0xFFFF7eb3)],
            [const Color(0xFF4facfe), const Color(0xFF00f2fe)],
          ];

          final colors = gradients[index % gradients.length];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
              ),

              borderRadius: BorderRadius.circular(16),
            ),

            child: ListTile(
              contentPadding: const EdgeInsets.all(16),

              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white24,

                child: Text(
                  dosen.nama.substring(0,1),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              title: Text(
                dosen.nama,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 6),

                  Text(
                    "NIP: ${dosen.nip}",
                    style: const TextStyle(color: Colors.white70),
                  ),

                  Text(
                    dosen.email,
                    style: const TextStyle(color: Colors.white70),
                  ),

                  Text(
                    dosen.jurusan,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}