import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:d4tivokasi/core/widgets/common_widgets.dart';

import 'package:d4tivokasi/features/dosen/presentation/providers/dosen_provider.dart';
import 'package:d4tivokasi/features/dosen/presentation/widgets/dosen_widget.dart';

class DosenPage extends ConsumerWidget {
  const DosenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dosenState = ref.watch(dosenNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Dosen"),
      ),

      body: dosenState.when(

        loading: () => const LoadingWidget(),

        error: (error, stack) => CustomErrorWidget(
          message: error.toString(),
          onRetry: () {
            ref.read(dosenNotifierProvider.notifier).refresh();
          },
        ),

        data: (dosenList) {
          return DosenListView(
            dosenList: dosenList,
            onRefresh: () {
              ref.read(dosenNotifierProvider.notifier).refresh();
            },
          );
        },
      ),
    );
  }
}