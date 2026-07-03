import 'package:flutter/material.dart';
import 'package:nafi3_project/features/profile/screen/profile_screen.dart';
import 'package:nafi3_project/features/add_donation/add_donation_screen.dart';
import 'package:nafi3_project/features/favorits/favorit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // لإخفاء شريط الـ Debug الأحمر
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // تم تحديد شاشة البروفايل كشاشة رئيسية، تقدري تبدليها بـ FavoritesScreen() في أي وقت
      home: const ProfileScreen(), 
    );
  }
}