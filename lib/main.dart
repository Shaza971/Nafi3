import 'package:flutter/material.dart';
import 'package:nafi3_project/core/utils/app_colors.dart';
import 'package:nafi3_project/features/auth/login.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
