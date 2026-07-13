import 'package:flutter/material.dart';

class SecurityPrivacyScreen extends StatefulWidget {
  const SecurityPrivacyScreen({super.key});

  @override
  State<SecurityPrivacyScreen> createState() =>
      _SecurityPrivacyScreenState();
}

class _SecurityPrivacyScreenState extends State<SecurityPrivacyScreen> {
  bool biometric = true;
  bool appLock = false;
  bool showOnlineStatus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Security & Privacy"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Security",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.fingerprint),
              title: const Text("Use Fingerprint"),
              value: biometric,
              onChanged: (value) {
                setState(() {
                  biometric = value;
                });
              },
            ),
          ),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.lock),
              title: const Text("App Lock"),
              value: appLock,
              onChanged: (value) {
                setState(() {
                  appLock = value;
                });
              },
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            "Privacy",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.visibility),
              title: const Text("Show Online Status"),
              value: showOnlineStatus,
              onChanged: (value) {
                setState(() {
                  showOnlineStatus = value;
                });
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.password),
              title: const Text("Change Password"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.delete_forever, color: Colors.red),
              title: const Text("Delete Account"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}