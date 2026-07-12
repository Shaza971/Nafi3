import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nafi3_project/features/add_donation/data/donation_repo.dart';

class CategoryScreen extends StatelessWidget {
final DonationRepo donationRepo = DonationRepo();
  final String category;

  CategoryScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(category),
      ),
     body: StreamBuilder<QuerySnapshot>(
  stream: donationRepo.getDonationsByCategory(category),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      return const Center(
        child: Text("No Donations Yet"),
      );
    }

    final donations = snapshot.data!.docs;

    return ListView.builder(
      itemCount: donations.length,
      itemBuilder: (context, index) {
        final donation = donations[index];

        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(donation["title"]),
            subtitle: Text(donation["description"]),
            trailing: Text(donation["location"]),
          ),
        );
      },
    );
  },
),
    );
  }

}