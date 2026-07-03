import 'package:flutter/material.dart';
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
      debugShowCheckedModeBanner:
          false, // اختياري: لإخفاء شريط الـ Debug الأحمر
      theme: ThemeData(
        // تم تصحيح السطر التالي بإضافة ColorScheme قبل .fromSeed
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          FavoritesScreen(), // يُفضل إضافة const إذا كانت الشاشة تدعم ذلك وتحسين الأداء
    );
  }
}
