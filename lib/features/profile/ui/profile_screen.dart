import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafi3_project/core/widget/donation_card.dart';
import 'package:nafi3_project/core/widget/navbar.dart';
import 'package:nafi3_project/core/widget/saved_causes_card.dart';
import 'package:nafi3_project/core/widget/settings_list.dart';
import 'package:nafi3_project/features/auth/data/auth_repo.dart';
import 'package:nafi3_project/features/auth/ui/login.dart';
import 'package:nafi3_project/features/auth/data/firestore_repo.dart';
import 'package:nafi3_project/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthRepo authRepo = AuthRepo();
  final FirestoreRepo firestoreRepo = FirestoreRepo();

  bool isDark = false;
  String userName = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    getUserData();
    loadTheme();
  }

  Future<void> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    // بيجيب المستخدم اللي جاب ال login

    if (user == null) return;
    // بنتاكد ازي في مستخدم اصلا

    email = user.email ?? "";

    final doc = await firestoreRepo.getUser(user.uid);
    //قراءة بيانات المستخدم من Firestore

    if (doc.exists) {
      setState(() {  //بحدث الشاشه  ال
        userName = doc["name"];
      });
    }
  }

  Future<void> loadTheme() async {
  final prefs = await SharedPreferences.getInstance();

  setState(() {
    isDark = prefs.getBool("darkMode") ?? false;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: const Text('Community Hub'),
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
             
              profileHeader( userName,  email),
               const DonationCard(),
            const SizedBox(height:12),
             const SavedCausesCard(),
             const SizedBox(height:12),
              themeButton(),
              const SettingsList(),  
                const SizedBox(height:12),
              logoutButton(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(currentIndex: 3),
    );
  }


////////////////////////widgets//////////////////////
  
Widget themeButton() {
  return Container(
    margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(16),
    ),
    child: SwitchListTile(
      contentPadding: EdgeInsets.zero,
      secondary: const Icon(
        Icons.dark_mode,
        color: Colors.black,
      ),
      title: const Text(
        "Dark Mode",
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      value: isDark,
      onChanged: (value) {
        setState(() {
          isDark = value;
        });

        MyApp.of(context)?.changeTheme(value);
      },
    ),
  );
}

Widget profileHeader(String name, String email) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
    child: SizedBox(
      width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          child: Icon(
            Icons.person,
            size: 50,
            color: Theme.of(context).iconTheme.color,
          ),
        ),

        const SizedBox(height: 16),

        Text(
          name.isEmpty ? "User" : name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          email,
          style: const TextStyle(
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


Widget logoutButton(BuildContext context) {
  return GestureDetector(
    onTap: () async {
      final authRepo = AuthRepo();

      await authRepo.signOut();

      Navigator.pushAndRemoveUntil(
        //تفتح صفحة جديدة.
        //تمسح كل الصفحات القديمة.
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
        (route) => false, //حذف كل الصفحات السابقة
      );
    },
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
      ),
    );
}

}

