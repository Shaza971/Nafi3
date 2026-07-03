import 'package:flutter/material.dart';
import 'package:nafi3_project/core/utils/app_colors.dart';
import 'package:nafi3_project/core/widget/donation_card.dart';
import 'package:nafi3_project/core/widget/navbar.dart';
import 'package:nafi3_project/core/widget/saved_causes_card.dart';
import 'package:nafi3_project/core/widget/settings_list.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor:AppColors.backgroundColor,
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
            children: [
              profileHeader(),
               const DonationCard(),
            const SizedBox(height:12),
             const SavedCausesCard(),
             const SizedBox(height:12),
              const SettingsList(),  
                const SizedBox(height:12),
              logoutButton()
            ],
          ),
        ),
      ),
     bottomNavigationBar: const Navbar(currentIndex: 3),
    );
  }
}

////////////////////////widgets//////////////////////
  
Widget profileHeader()
{
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

Widget logoutButton()
{
 return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.logout,
            color: Colors.red,
          ),
          SizedBox(width: 8),
          Text(
            "Logout",
            style: TextStyle(
              color: Colors.red,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

