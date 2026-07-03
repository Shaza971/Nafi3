import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            buildSettingsTile(
              title: "Personal Information",
              icon: Icons.person_outline,
              onTap: () {},
            ),

            const Divider(height: 1),

            buildSettingsTile(
              title: "Donation History",
              icon: Icons.history,
              onTap: () {},
            ),

            const Divider(height: 1),

            buildSettingsTile(
              title: "Notification Settings",
              icon: Icons.notifications_none,
              onTap: () {},
            ),

            const Divider(height: 1),

            buildSettingsTile(
              title: "Security & Privacy",
              icon: Icons.lock_outline,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingsTile({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8,
      ),
      leading: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: const Color(0xffE8F5E9),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: const Color(0xff1B5E20),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}