import 'package:flutter/material.dart';
import 'package:nafi3_project/features/profile/widget/donation_card.dart';
import 'package:nafi3_project/features/profile/widget/logout_button.dart';
import 'package:nafi3_project/features/profile/widget/profile_header.dart';
import 'package:nafi3_project/features/profile/widget/saved_causes_card.dart';
import 'package:nafi3_project/features/profile/widget/settings_list.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         leading: const Icon(
        Icons.arrow_back,
        color: Colors.black,
  ),
        title: const Text("Community Hub"),
        centerTitle: true,

        actions: const [
      Padding(
      padding: EdgeInsets.only(right: 16),
      child: Icon(Icons.more_vert),
    ),
  ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              ProfileHeader(),
               DonationCard(),
            SizedBox(height:12),
             SavedCausesCard(),
             SizedBox(height:12),
              SettingsList(),  
                SizedBox(height:12),
             LogoutButton()
            ],
          ),
        ),
      ),
    );
  }
}