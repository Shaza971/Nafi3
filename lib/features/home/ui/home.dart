import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafi3_project/core/utils/app_assets.dart';
import 'package:nafi3_project/core/utils/app_colors.dart';
import 'package:nafi3_project/core/widget/navbar.dart';

class Home extends StatefulWidget {
  final String? userName;

  const Home({super.key, this.userName});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;
  String userName = '';
  bool isLoadingName = true;

  @override
  void initState() {
    super.initState();
    if (widget.userName != null && widget.userName!.isNotEmpty) {
      userName = widget.userName!;
      isLoadingName = false;
    } else {
      loadUserName();
    }
  }

  Future<void> loadUserName() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        setState(() {
          userName = 'Guest';
          isLoadingName = false;
        });
        return;
      }

      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .get();

      if (doc.exists && doc.data()?['name'] != null) {
        setState(() {
          userName = doc.data()!['name'];
          isLoadingName = false;
        });
      } else {
        setState(() {
          userName = 'Guest';
          isLoadingName = false;
        });
      }
    } catch (e) {
      debugPrint('Firestore Error: $e');
      setState(() {
        userName = 'Guest';
        isLoadingName = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Nafi3',
              style: TextStyle(color: AppColors.primaryColor),
            ),
            Icon(
              Icons.notifications_outlined,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isLoadingName
                  ? const SizedBox(
                      height: 30,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      'Hello, $userName!',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const Text('What would you like to find today? '),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for Donaton...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: Icon(
                    Icons.tune,
                    color: AppColors.primaryColor,
                  ),
                  filled: true,
                  fillColor: const Color(0xffF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    categoryCard('Food', Icons.restaurant),
                    categoryCard('Clothes', Icons.checkroom),
                    categoryCard('Medicine', Icons.medical_services),
                    categoryCard('Books', Icons.menu_book),
                    categoryCard(
                      'Skills',
                      Icons.psychology_outlined,
                      isNew: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Recent Donations',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              recentCard(
                'Food',
                'Organic Vegetable Box',
                '2.5 km away',
                AppAssets.vegetables,
              ),
              const SizedBox(height: 20),
              recentCard(
                'Clothes',
                'Winter Jackets (Kids)',
                '0.8 km away',
                AppAssets.toy,
              ),
              const SizedBox(height: 20),
              recentCard(
                'Books',
                'Educational Books Set',
                '1.2 km away',
                AppAssets.books,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar(currentIndex: 0),
    );
  }
}

////////////////////////////////wedgets////////////////////////

Widget recentCard(
  String category,
  String title,
  String distance,
  String img,
) {
  return Card(
    elevation: 3,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              img,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 18,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget categoryCard(String title, IconData icon, {bool isNew = false}) {
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: Column(
      children: [
        Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xffE8F4E6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: AppColors.primaryColor,
                size: 40,
              ),
            ),
            if (isNew)
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(title),
      ],
    ),
  );
}