//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nafi3_project/features/model/onboarding_model.dart';
import 'firebase_options.dart';

import 'package:nafi3_project/core/utils/app_colors.dart';
//import 'package:nafi3_project/features/auth/login.dart';
Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options:DefaultFirebaseOptions.currentPlatform,

  // );
  runApp(const MyApp());
}

// class DefaultFirebaseOptions {
//   static FirebaseOptions? get currentPlatform => null;
// }

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
      home: OnboardingScreen(),
    );
  }
}
