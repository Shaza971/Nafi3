import 'package:flutter/material.dart';

class DonationCard extends StatelessWidget {
  const DonationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.volunteer_activism,
                color: Color(0xff1B5E20),
                size: 32,
              ),

              const SizedBox(height: 10),

              const Text(
                "Total Donations",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "\$4250",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              const LinearProgressIndicator(
                value: 0.75,
                minHeight: 8,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "75% of yearly goal",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}