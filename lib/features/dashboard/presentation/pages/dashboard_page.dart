import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:d4tivokasi/core/constants/app_constants.dart';
import 'package:d4tivokasi/core/widgets/common_widgets.dart';

import 'package:d4tivokasi/features/dashboard/presentation/providers/dashboard_provider.dart';
import 'package:d4tivokasi/features/dashboard/presentation/widgets/dashboard_widgets.dart';

import 'package:d4tivokasi/features/mahasiswa/presentation/pages/mahasiswa_page.dart';
import 'package:d4tivokasi/features/mahasiswa_aktif/presentation/pages/mahasiswa_aktif_page.dart';
import 'package:d4tivokasi/features/dosen/presentation/pages/dosen_page.dart';
import 'package:d4tivokasi/features/profile/presentation/pages/profile_page.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final dashboardState = ref.watch(dashboardNotifierProvider);

    return Scaffold(

      body: dashboardState.when(

        loading: () => const LoadingWidget(),

        error: (error, stack) => CustomErrorWidget(
          message: error.toString(),
          onRetry: () {
            ref.read(dashboardNotifierProvider.notifier).refresh();
          },
        ),

        data: (dashboardData) {

          return RefreshIndicator(

            onRefresh: () async {
              ref.invalidate(dashboardNotifierProvider);
            },

            child: CustomScrollView(

              slivers: [

                /// HEADER BIRU
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withOpacity(0.8)
                        ],
                      ),

                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                const Text(
                                  "Selamat Datang 👋",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  dashboardData.userName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const IconButton(
                                onPressed: null,
                                icon: Icon(Icons.notifications_none),
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),

                          child: Row(
                            children: [

                              const Icon(Icons.calendar_today,
                                  size: 16, color: Colors.white),

                              const SizedBox(width: 8),

                              Text(
                                "Update: ${dashboardData.lastUpdate}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                /// JUDUL STATISTIK
                SliverPadding(
                  padding: const EdgeInsets.all(16),

                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        const Text(
                          "Statistik",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        TextButton.icon(
                          onPressed: () {
                            ref.invalidate(dashboardNotifierProvider);
                          },

                          icon: const Icon(Icons.refresh, size: 18),

                          label: const Text("Refresh"),
                        )
                      ],
                    ),
                  ),
                ),

                /// GRID CARD
                SliverPadding(

                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  sliver: SliverGrid(

                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.1,
                    ),

                    delegate: SliverChildBuilderDelegate(

                          (context, index) {

                        final stat = dashboardData.stats[index];

                        Widget? targetPage;

                        switch (stat.title) {
                          case 'Total Mahasiswa':
                            targetPage = const MahasiswaPage();
                            break;

                          case 'Mahasiswa Aktif':
                            targetPage = const MahasiswaAktifPage();
                            break;

                          case 'Dosen':
                            targetPage = const DosenPage();
                            break;

                          case 'Profile':
                            targetPage = const ProfilePage();
                            break;
                        }

                        return ModernStatCard(
                          stats: stat,
                          icon: Icons.analytics,
                          gradientColors: AppConstants.dashboardGradients[
                          index %
                              AppConstants.dashboardGradients.length],

                          onTap: () {
                            if (targetPage != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => targetPage!),
                              );
                            }
                          },
                        );
                      },

                      childCount: dashboardData.stats.length,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}