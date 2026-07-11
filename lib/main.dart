import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'package:nafi3_project/features/model/ui/onboarding_model.dart';
import 'package:nafi3_project/features/auth/ui/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();

  bool seenOnboarding =
      prefs.getBool("seenOnboarding") ?? false;

  runApp(
    MyApp(
      seenOnboarding: seenOnboarding,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool seenOnboarding;

  const MyApp({
    super.key,
    required this.seenOnboarding,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: seenOnboarding
          ? const LoginScreen()
          : const OnboardingScreen(),
    );
  }
}