import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        "title": "Donation Completed",
        "subtitle": "Your donation has been received successfully.",
        "icon": Icons.favorite,
        "color": Colors.red,
        "time": "2 min ago",
      },
      {
        "title": "New Campaign",
        "subtitle": "A new donation campaign is available.",
        "icon": Icons.campaign,
        "color": Colors.green,
        "time": "1 hour ago",
      },
      {
        "title": "Reminder",
        "subtitle": "Don't forget to check today's opportunities.",
        "icon": Icons.notifications_active,
        "color": Colors.orange,
        "time": "Yesterday",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item["color"].withOpacity(0.15),
                child: Icon(
                  item["icon"],
                  color: item["color"],
                ),
              ),
              title: Text(
                item["title"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item["subtitle"]),
                  const SizedBox(height: 5),
                  Text(
                    item["time"],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}