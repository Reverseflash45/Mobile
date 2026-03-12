import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:d4tivokasi/core/widgets/common_widgets.dart';

import 'package:d4tivokasi/features/mahasiswa_aktif/presentation/providers/mahasiswa_aktif_provider.dart';
import 'package:d4tivokasi/features/mahasiswa_aktif/presentation/widgets/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mahasiswaAktifState = ref.watch(mahasiswaAktifNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahasiswa Aktif"),
      ),

      body: mahasiswaAktifState.when(

        loading: () => const LoadingWidget(),

        error: (error, stack) => CustomErrorWidget(
          message: error.toString(),
          onRetry: () {
            ref.read(mahasiswaAktifNotifierProvider.notifier).refresh();
          },
        ),

        data: (mahasiswaList) {

          return MahasiswaAktifListView(
            mahasiswaList: mahasiswaList,
            onRefresh: () {
              ref.read(mahasiswaAktifNotifierProvider.notifier).refresh();
            },
          );
        },
      ),
    );
  }
}