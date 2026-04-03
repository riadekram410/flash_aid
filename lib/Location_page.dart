import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _infoCard(
                icon: Icons.location_on,
                iconColor: Colors.blue,
                title: "Your Location",
                subtitle: "128 Shantinagor Pir Sheheber Goli",
              ),

              const SizedBox(height: 10),

              _infoCard(
                icon: Icons.local_hospital,
                iconColor: Colors.red,
                title: "Nearest Hospital",
                subtitle:
                "Bangabandhu Sheikh Mujib Medical University",
              ),

              const SizedBox(height: 14),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "⚠ Need urgent medical assistance?",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Nearby Hospitals:",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView(
                  children: const [
                    HospitalTile(
                      name: "Dhaka Medical College Hospital",
                      address: "Secretariat Rd, Central Shahbag",
                    ),
                    HospitalTile(
                      name: "Square Hospital",
                      address: "Panthapath, Dhaka",
                    ),
                    HospitalTile(
                      name: "United Hospital",
                      address: "Road 71, Gulshan 2",
                    ),
                    HospitalTile(
                      name: "Labaid Specialized Hospital",
                      address: "Dhanmondi 8/A, Dhaka",
                    ),
                    HospitalTile(
                      name: "Evercare Hospital Dhaka",
                      address: "Bashundhara, Dhaka",
                    ),
                    HospitalTile(
                      name: "Asgar Ali Hospital",
                      address: "Gandaria, Dhaka",
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "🔍 Search Hospital",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: iconColor.withOpacity(0.1),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class HospitalTile extends StatelessWidget {
  final String name;
  final String address;

  const HospitalTile({
    super.key,
    required this.name,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xfffdeaea),
            child: Icon(Icons.local_hospital, color: Colors.red),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  address,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}