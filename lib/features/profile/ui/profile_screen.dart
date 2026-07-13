import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafi3_project/core/widget/donation_card.dart';
import 'package:nafi3_project/core/widget/navbar.dart';
import 'package:nafi3_project/core/widget/saved_causes_card.dart';
import 'package:nafi3_project/core/widget/settings_list.dart';
import 'package:nafi3_project/features/auth/data/auth_repo.dart';
import 'package:nafi3_project/features/auth/ui/login.dart'; // تأكدي إن الكلاس جوه الملف ده اسمه فعلاً LoginScreen
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
    if (user == null) return;

    email = user.email ?? "";

    try {
      final doc = await firestoreRepo.getUser(user.uid);
      if (doc.exists && doc.data() != null) {
        setState(() {
          userName = doc["name"] ?? "";
        });
      }
    } catch (e) {
      debugPrint("Error fetching user data: $e");
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
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // تفعيل الرجوع للخلف بدل الأيقونة الثابتة
          },
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
              profileHeader(userName, email),
              const DonationCard(),
              const SizedBox(height: 12),
              const SavedCausesCard(),
              const SizedBox(height: 12),
              themeButton(),
              const SettingsList(),
              const SizedBox(height: 12),
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
        secondary: Icon(
          Icons.dark_mode,
          color: Theme.of(
            context,
          ).iconTheme.color, // يتغير لونه تلقائياً مع الثيم
        ),
        title: const Text(
          "Dark Mode",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        value: isDark,
        onChanged: (value) async {
          setState(() {
            isDark = value;
          });

          // حفظ الثيم الجديد في الـ SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool("darkMode", value);

          if (mounted) {
            MyApp.of(context)?.changeTheme(value);
          }
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
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Icon(
                Icons.person,
                size: 50,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name.isEmpty ? "User" : name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        // 1. تسجيل الخروج من الفايربيز فعلياً
        await FirebaseAuth.instance.signOut();

        if (context.mounted) {
          // 2. الانتقال لصفحة اللوجن ومسح شاشات الـ Stack القديمة
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false,
          );
        }
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: Colors.red),
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
