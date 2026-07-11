import 'package:flutter/material.dart';
import 'package:nafi3_project/core/utils/app_assets.dart';
import 'package:nafi3_project/core/utils/app_colors.dart';
import 'package:nafi3_project/core/widget/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nafi3_project/features/auth/data/firestore_repo.dart';
import 'package:nafi3_project/features/home/ui/category_screen.dart';
import 'package:nafi3_project/features/home/ui/donation_details_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirestoreRepo firestoreRepo = FirestoreRepo();

  String userName = "";

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  Future<void> getUserName() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final doc = await firestoreRepo.getUser(user.uid);

    if (doc.exists) {
      setState(() {
        userName = doc["name"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor:AppColors.backgroundColor,
        title:
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Nafi3",style: TextStyle(color: AppColors.primaryColor),),

           Icon(Icons.notifications_outlined,color: AppColors.primaryColor,)
              ],
              ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello, $userName 👋",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("What would you like to find today? "),
              const SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search for Donaton...",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.tune,color: AppColors.primaryColor,),
                  filled: true,
                  fillColor: Color(0xffF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  ),
                  Text("View All",style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14,
                  ),)
                ],
              ),
               const SizedBox(height: 20,),
              SizedBox(
              height: 120,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
              categoryCard(context, "Food", Icons.restaurant),
              categoryCard(context, "Clothes", Icons.checkroom),
              categoryCard(context, "Medicine", Icons.medical_services),
              categoryCard(context, "Books", Icons.menu_book),
              categoryCard(context, "Skills", Icons.psychology_outlined, isNew: true),
    ],
  ),
),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Donations",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  ),
                  Text("View All",style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14,
                  ),)
                ],
              ),
              const SizedBox(height: 20,),
              recentCard(context, "Food", "Organic Vegetable Box", "2.5 km away", AppAssets.vegetables),
              const SizedBox(height: 20,),
              recentCard(context, "Clothes", "Winter Jackets (Kids)", "0.8 km away", AppAssets.toy),
              const SizedBox(height: 20,),
              recentCard(context, "Books", "Educational Books Set", "1.2 km away", AppAssets.books),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navbar( currentIndex: 0),
    );
  }
}

////////////////////////////////wedgets////////////////////////

Widget recentCard(  BuildContext context,
  String category,
  String title,
  String distance,
  String img,
  ) 
{
  return GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DonationDetailsScreen(
          category: category,
          title: title,
          distance: distance,
          image: img,
        ),
      ),
    );
  },
  child:Card(
    elevation: 3,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Image
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
  ),
  );
}

Widget categoryCard(BuildContext context, String title,IconData icon, {bool isNew = false,})
 {
  return Padding(
    padding: const EdgeInsets.only(right: 16),
    child: Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      category: title,
                    ) as Widget,
                  ),
                );
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 36,
                    color: AppColors.primaryColor,
                  ),
                ),
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
                    "NEW",
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