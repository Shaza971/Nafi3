import 'package:flutter/material.dart';
import 'package:nafi3_project/core/utils/app_colors.dart';

class DonationDetailsScreen extends StatelessWidget {
  final String category;
  final String title;
  final String distance;
  final String image;

  const DonationDetailsScreen({
    super.key,
    required this.category,
    required this.title,
    required this.distance,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text("Donation Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              category,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                const Icon(Icons.location_on_outlined),
                const SizedBox(width: 5),
                Text(distance),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Donation Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "This donation is available for anyone in need. Please contact the donor to arrange pickup.",
            ),
          ],
        ),
      ),
    );
  }
}