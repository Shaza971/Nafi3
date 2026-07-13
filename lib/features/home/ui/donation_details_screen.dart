import 'package:flutter/material.dart';

class DonationDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> donation;

  const DonationDetailsScreen({
    super.key,
    required this.donation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text("Donation Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                Icons.volunteer_activism,
                size: 80,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              donation["category"],
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              donation["title"],
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
                Expanded(
                  child: Text(donation["location"]),
                ),
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

            Text(
              donation["description"],
            ),
          ],
        ),
      ),
    );
  }
}