import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:nafi3_project/features/model/ui/onboarding_model.dart';
import 'package:nafi3_project/features/auth/ui/login.dart';
import 'package:nafi3_project/core/theme/app_theme.dart';

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

class MyApp extends StatefulWidget {
  final bool seenOnboarding;

  const MyApp({
    super.key,
    required this.seenOnboarding,
  });

  // ignore: library_private_types_in_public_api
  static _MyAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    bool isDark = prefs.getBool("darkMode") ?? false;

    setState(() {
      themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  Future<void> changeTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool("darkMode", value);

    setState(() {
      themeMode = value ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,

      home: widget.seenOnboarding
          ? const LoginScreen()
          : const OnboardingScreen(),
    );
  }
}