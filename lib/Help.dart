import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  void _showMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Help & Support"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// HEADER
            const Text(
              "How can we help you?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Find answers or contact support",
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 20),

            /// QUICK ACTIONS
            Row(
              children: [
                Expanded(
                  child: _quickCard(
                    context,
                    icon: Icons.call,
                    title: "Call Support",
                    onTap: () =>
                        _showMessage(context, "Calling support..."),
                  ),
                ),
                Expanded(
                  child: _quickCard(
                    context,
                    icon: Icons.chat,
                    title: "Live Chat",
                    onTap: () =>
                        _showMessage(context, "Opening chat..."),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// FAQ TITLE
            const Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// FAQ LIST
            _faqTile(
              "How do I request an ambulance?",
              "Go to the emergency page and tap on 'Call Ambulance'.",
            ),
            _faqTile(
              "How long does it take?",
              "Usually within 10-15 minutes depending on location.",
            ),
            _faqTile(
              "Can I choose a hospital?",
              "Yes, you can select your preferred hospital.",
            ),
            _faqTile(
              "What payment methods are available?",
              "bKash, Cash, and Online Banking.",
            ),

            const SizedBox(height: 20),

            /// CONTACT SECTION
            const Text(
              "Contact Us",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            _contactTile(
              context,
              icon: Icons.email,
              title: "Email Support",
              subtitle: "support@flashaid.com",
              onTap: () =>
                  _showMessage(context, "Opening email..."),
            ),

            _contactTile(
              context,
              icon: Icons.phone,
              title: "Hotline",
              subtitle: "999 (Emergency)",
              onTap: () =>
                  _showMessage(context, "Calling 999..."),
            ),
          ],
        ),
      ),
    );
  }

  /// QUICK CARD
  Widget _quickCard(BuildContext context,
      {required IconData icon,
        required String title,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.red, size: 30),
            const SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }

  /// FAQ TILE
  Widget _faqTile(String question, String answer) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(answer),
          ),
        ],
      ),
    );
  }

  /// CONTACT TILE
  Widget _contactTile(BuildContext context,
      {required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap}) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.red),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}