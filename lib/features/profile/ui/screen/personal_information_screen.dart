import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nafi3_project/features/auth/data/firestore_repo.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState
    extends State<PersonalInformationScreen> {

  final FirestoreRepo firestoreRepo = FirestoreRepo();
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Information"),
        backgroundColor: Colors.green,
      ),

      body: FutureBuilder<DocumentSnapshot>(
        future: firestoreRepo.getUser(user!.uid),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(
              child: Text("No user data found"),
            );
          }

          final data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      child: Icon(Icons.person, size: 40),
                    ),

                    const SizedBox(height: 20),

                   ListTile(
  leading: const Icon(Icons.person_outline),
  title: const Text("Full Name"),
  subtitle: Text(data["name"] ?? "Not provided"),
),

const Divider(),

ListTile(
  leading: const Icon(Icons.email_outlined),
  title: const Text("Email"),
  subtitle: Text(data["email"] ?? "Not provided"),
),




const Divider(),

ListTile(
  leading: const Icon(Icons.phone),
  title: const Text("Phone Number"),
  subtitle: const Text("01012345678"),
),

const Divider(),

ListTile(
  leading: const Icon(Icons.cake),
  title: const Text("Date of Birth"),
  subtitle: const Text("20/08/2006"),
),

const Divider(),

ListTile(
  leading: const Icon(Icons.person),
  title: const Text("Gender"),
  subtitle: const Text("Female"),
),

const Divider(),

ListTile(
  leading: const Icon(Icons.location_on),
  title: const Text("City"),
  subtitle: const Text("Minya"),
),

const Divider(),

ListTile(
  leading: const Icon(Icons.favorite),
  title: const Text("Favorite Cause"),
  subtitle: const Text("Education"),
),
                    //   const Divider(),

                    // ListTile(
                    //   leading: const Icon(Icons.email_outlined),
                    //   title: const Text("Password"),
                    //   subtitle: Text(data["password"] ?? ""),
                    // ),
                    

                  ],

                  
                ),
              ),
            ),
          );
        },
      ),
    );
  }



}

