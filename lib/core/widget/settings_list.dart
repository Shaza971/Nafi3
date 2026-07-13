import 'package:flutter/material.dart';
import 'package:nafi3_project/features/profile/ui/screen/donation_history_screen.dart';
import 'package:nafi3_project/features/profile/ui/screen/notification_settings_screen.dart';
import 'package:nafi3_project/features/profile/ui/screen/personal_information_screen.dart';
import 'package:nafi3_project/features/profile/ui/screen/security_privacy_screen.dart';

// import 'package:nafi3_project/features/profile/screen/personal_information_screen.dart';
// import 'package:nafi3_project/features/profile/screen/donation_history_screen.dart';

// import 'package:nafi3_project/features/profile/screen/security_privacy_screen.dart';

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
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
       children: [
  buildSettingsTile(
    context,
    title: "Personal Information",
    icon: Icons.person_outline,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const PersonalInformationScreen(),
        ),
      );
    },
  ),

  const Divider(height: 1),

  buildSettingsTile(
    context,
    title: "Donation History",
    icon: Icons.history,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const DonationHistoryScreen(),
        ),
      );
    },
  ),

  const Divider(height: 1),

  buildSettingsTile(
    context,
    title: "Notification Settings",
    icon: Icons.notifications_none,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const NotificationsScreen(),
        ),
      );
    },
  ),

  const Divider(height: 1),

  buildSettingsTile(
    context,
    title: "Security & Privacy",
    icon: Icons.lock_outline,
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SecurityPrivacyScreen(),
        ),
      );
    },
  ),
],
        ),
      ),
    );
  }

  Widget buildSettingsTile(
    BuildContext context, {
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
          color: Theme.of(context).cardColor,
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