import 'package:flutter/material.dart';

class DonationHistoryScreen extends StatelessWidget {
  const DonationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donation History"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [

          ListTile(
            leading: Icon(Icons.favorite,color: Colors.green),
            title: Text("Food Donation"),
            subtitle: Text("15 July 2026"),
            trailing: Text("\$50"),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.water_drop,color: Colors.blue),
            title: Text("Clean Water"),
            subtitle: Text("10 July 2026"),
            trailing: Text("\$120"),
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.school,color: Colors.orange),
            title: Text("Education Support"),
            subtitle: Text("5 July 2026"),
            trailing: Text("\$80"),
          ),
        ],
      ),
    );
  }
}