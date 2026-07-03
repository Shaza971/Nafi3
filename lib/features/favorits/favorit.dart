import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, dynamic>> favoriteDonations = [
    {
      "image":
          "https://media.istockphoto.com/id/2284088718/photo/volunteers-donating-food-boxes-to-people-in-community-service.jpg?s=612x612&w=0&k=20&c=UCPdgNxhz9GPD4bPSjy-uXnuxpN0CyYx3xx4frZjNBQ=",
      "category": "Food",
      "title": "Family Food Package",
      "description": "Provide nutritious food packages for families in need.",
      "goal": "\$8,000",
      "progress": 0.68,
      "percentage": "68%",
    },
    {
      "image":
          "https://media.istockphoto.com/id/936497196/photo/woman-donates-warm-clothing-during-clothing-drive.jpg?s=612x612&w=0&k=20&c=6p8YMSn0UsxZ4jiWJIg1xcdRa6u-M0Pq9jWE0MhxL_Q=",
      "category": "Clothes",
      "title": "Winter Clothes Drive",
      "description":
          "Donate warm clothes to support children and families this winter.",
      "goal": "\$5,000",
      "progress": 0.45,
      "percentage": "45%",
    },
    {
      "image":
          "https://tse2.mm.bing.net/th/id/OIP.FI0Zvkgv8ckRh8vXyhPsVgHaHZ?rs=1&pid=ImgDetMain&o=7&rm=3",
      "category": "Education",
      "title": "School Supplies",
      "description":
          "Help students by providing books, backpacks, and school essentials.",
      "goal": "\$12,000",
      "progress": 0.82,
      "percentage": "82%",
    },
    {
      "image":
          "https://ivhq-secure.imgix.net/images/projects/china/volunteer-abroad-in-china-ivhq-guangxi-rural-teaching.jpg?w=360&h=180&fit=crop&crop=faces%2Ccenter&auto=format%2Ccompress&s=476f6970951adb8f5c0003b50fd563a6",
      "category": "Skills",
      "title": "Volunteer Your Skills",
      "description":
          "Share your knowledge by teaching programming, languages, or design.",
      "goal": "120 Volunteers",
      "progress": 0.55,
      "percentage": "55%",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Nafi3",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.more_vert, color: Colors.green),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Favorites",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Keep your favorite donation requests in one place.\nSupport the causes you care about anytime.",
              style: TextStyle(fontSize: 17, color: Colors.black54),
            ),

            SizedBox(height: 30),
            appfavcont(),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  appfavcont() {
    return Expanded(
      child: ListView.builder(
        itemCount: favoriteDonations.length,
        itemBuilder: (context, index) {
          final donation = favoriteDonations[index];

          return Container(
            margin: EdgeInsets.only(bottom: 22),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 8),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.network(
                        donation["image"],
                        height: 190,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      top: 12,
                      right: 12,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: null,
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 15,
                      bottom: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          donation["category"],
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        donation["title"],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        donation["description"],
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),

                      const SizedBox(height: 18),

                      Row(
                        children: [
                          Text(
                            "Goal: ${donation["goal"]}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),

                          Spacer(),

                          Text(
                            donation["percentage"],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: donation["progress"],
                                color: Colors.green,
                                backgroundColor: Colors.grey.shade300,
                                minHeight: 8,
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          ElevatedButton(
                            onPressed: null,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 14,
                              ),
                            ),

                            child: const Text(
                              "Donate",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
