import 'package:flutter/material.dart';
import 'package:d4tivokasi/features/dashboard/data/models/dashboard_model.dart';

class ModernStatCard extends StatelessWidget {

  final DashboardStats stats;
  final IconData icon;
  final List<Color> gradientColors;
  final VoidCallback? onTap;

  const ModernStatCard({
    super.key,
    required this.stats,
    required this.icon,
    required this.gradientColors,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: gradientColors,
          ),
        ),
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Icon(icon, color: Colors.white),

            const Spacer(),

            Text(
              stats.value,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              stats.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}