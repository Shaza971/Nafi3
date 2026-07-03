import 'package:flutter/material.dart';

class SavedCausesCard extends StatelessWidget {
  const SavedCausesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Card(
        color: Colors.white,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.bookmark_added,
                color: Color(0xff1B5E20),
                size: 28,
              ),

              const SizedBox(height: 10),

              // Container(
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: 14,
              //     vertical: 6,
              //   ),
              //   decoration: BoxDecoration(
              //     color: const Color(0xffEAF5ED),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: const Text(
              //     'Active',
              //     style: TextStyle(
              //       color: Color(0xff2E5A36),
              //       fontWeight: FontWeight.w500,
              //       fontSize: 14,
              //     ),
              //   ),
              // ),

              // const SizedBox(height: 20),

              const Text(
                "Saved Causes",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "12",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              SizedBox(
                height: 40,
                child: Stack(
                  children: [
                    buildAvatar(
                      0,
                      'https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?w=100',
                    ),
                    buildAvatar(
                      1,
                      'https://images.unsplash.com/photo-1431540015161-0bf868a2d407?w=100',
                    ),
                    buildAvatar(
                      2,
                      'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?w=100',
                    ),

                    Positioned(
                      left: 75,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          '+9',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Recently Added : Clean Water Initiative",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAvatar(int index, String imageUrl) {
    return Positioned(
      left: index * 25.0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(imageUrl),
          backgroundColor: Colors.grey,
        ),
      ),
    );
  }
}