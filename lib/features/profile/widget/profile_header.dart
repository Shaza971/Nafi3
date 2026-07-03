import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
  child: SizedBox(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 50,
          child: Icon(
            Icons.person,
            size: 50,
          ),
        ),

        const SizedBox(height: 16),

        const Text(
          "Sara Mohamed",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          "sarah.j@email.com",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),

        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text(
            "Gold Level Giver",
            style: TextStyle(
              color: Color.fromARGB(255, 51, 107, 47),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  ),
);
  }
} 