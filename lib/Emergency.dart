import 'package:flutter/material.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Emergency Ambulance"),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// Title
            const Text(
              "Need an Ambulance?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Press the button below to request ambulance service",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 30),

            /// BIG BUTTON
            SizedBox(
              width: double.infinity,
              height: 120,
              child: ElevatedButton(
                onPressed: () {
                  _showMessage(context, "Ambulance Requested");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_hospital,
                        size: 40, color: Colors.white),
                    SizedBox(height: 10),
                    Text(
                      "CALL AMBULANCE",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// OPTIONS
            Card(
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.red),
                title: const Text("Select Hospital"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  _showMessage(context, "Go to hospital selection page");
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.share_location, color: Colors.red),
                title: const Text("Share Location"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  _showMessage(context, "Location shared");
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}