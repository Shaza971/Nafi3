import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nafi3_project/core/utils/app_colors.dart';
import 'package:nafi3_project/features/auth/ui/login.dart';
import 'package:nafi3_project/firebase_options.dart';

void main() async {
  //
  // 0- connect your app with firebase project
  // 0.1- await Firebase.initializeApp(
 WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
 );
//
//
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
///////// 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}