import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// APP HEADER
            Center(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.local_hospital,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "FlashAid",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Emergency Ambulance Service",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// ABOUT DESCRIPTION
            const Text(
              "About FlashAid",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "FlashAid is a fast and reliable emergency ambulance service app. "
                  "Our goal is to help users quickly request ambulance support during critical situations. "
                  "We connect patients with nearby ambulance services and hospitals in the shortest time possible.",
              style: TextStyle(
                height: 1.5,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            /// MISSION
            const Text(
              "Our Mission",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "To provide fast, accessible, and life-saving ambulance services "
                  "for everyone, anytime, anywhere.",
              style: TextStyle(color: Colors.black87),
            ),

            const SizedBox(height: 20),

            /// FEATURES
            const Text(
              "Key Features",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            _featureTile("🚑 Quick Ambulance Request"),
            _featureTile("📍 Location-based service"),
            _featureTile("🏥 Hospital selection"),
            _featureTile("💳 Multiple payment options"),

            const SizedBox(height: 20),

            /// DEVELOPER INFO
            const Text(
              "Developer",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Developed by FlashAid Team\n"
                  "CSE Student Project",
              style: TextStyle(color: Colors.black87),
            ),

            const SizedBox(height: 20),

            /// CONTACT
            const Text(
              "Contact",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.red),
                title: const Text("Email"),
                subtitle: const Text("support@flashaid.com"),
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.red),
                title: const Text("Hotline"),
                subtitle: const Text("999 (Emergency)"),
              ),
            ),

            const SizedBox(height: 20),

            /// FOOTER
            const Center(
              child: Text(
                "© 2026 FlashAid",
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureTile(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.red, size: 18),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}