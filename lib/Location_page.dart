import 'package:flutter/material.dart';
import 'Confirmation_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  bool isEditingLocation = false;
  bool isEditingHospital = false;

  String locationText = "";
  String hospitalText = "";

  @override
  Widget build(BuildContext context) {

    bool isReady = locationText.isNotEmpty && hospitalText.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              GestureDetector(
                onTap: () {
                  setState(() {
                    isEditingLocation = true;
                  });
                },
                child: _infoCard(
                  icon: Icons.location_on,
                  iconColor: Colors.blue,
                  title: "Your Location",
                  isEditing: isEditingLocation,
                  text: locationText,
                  onChanged: (value) {
                    setState(() {
                      locationText = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  setState(() {
                    isEditingHospital = true;
                  });
                },
                child: _infoCard(
                  icon: Icons.local_hospital,
                  iconColor: Colors.red,
                  title: "Choose your Hospital",
                  isEditing: isEditingHospital,
                  text: hospitalText,
                  onChanged: (value) {
                    setState(() {
                      hospitalText = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 14),

              GestureDetector(
                onTap: isReady
                    ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmationPage(),
                    ),
                  );
                }
                    : null,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: isReady ? Colors.red : Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      "Confirm Hospital Location",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
                  children: [
                    HospitalTile(
                      name: "Dhaka Medical College Hospital",
                      address: "Secretariat Rd, Central Shahbag",
                      onTap: () {
                        setState(() {
                          hospitalText = "Dhaka Medical College Hospital";
                          isEditingHospital = false;
                        });
                      },
                    ),
                    HospitalTile(
                      name: "Square Hospital",
                      address: "Panthapath, Dhaka",
                      onTap: () {
                        setState(() {
                          hospitalText = "Square Hospital";
                          isEditingHospital = false;
                        });
                      },
                    ),
                    HospitalTile(
                      name: "United Hospital",
                      address: "Road 71, Gulshan 2",
                      onTap: () {
                        setState(() {
                          hospitalText = "United Hospital";
                          isEditingHospital = false;
                        });
                      },
                    ),
                    HospitalTile(
                      name: "Labaid Specialized Hospital",
                      address: "Dhanmondi 8/A, Dhaka",
                      onTap: () {
                        setState(() {
                          hospitalText = "Labaid Specialized Hospital";
                          isEditingHospital = false;
                        });
                      },
                    ),
                    HospitalTile(
                      name: "Evercare Hospital Dhaka",
                      address: "Bashundhara, Dhaka",
                      onTap: () {
                        setState(() {
                          hospitalText = "Evercare Hospital Dhaka";
                          isEditingHospital = false;
                        });
                      },
                    ),
                    HospitalTile(
                      name: "Asgar Ali Hospital",
                      address: "Gandaria, Dhaka",
                      onTap: () {
                        setState(() {
                          hospitalText = "Asgar Ali Hospital";
                          isEditingHospital = false;
                        });
                      },
                    ),
                  ],
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
    required bool isEditing,
    required String text,
    required Function(String) onChanged,
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
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                isEditing
                    ? TextField(
                  onChanged: onChanged,
                  decoration: const InputDecoration(
                    hintText: "Enter here...",
                  ),
                )
                    : Text(
                  text.isEmpty ? "Tap to enter..." : text,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          const Icon(Icons.edit),
        ],
      ),
    );
  }
}


class HospitalTile extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback onTap;

  const HospitalTile({
    super.key,
    required this.name,
    required this.address,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(address, style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            ),

            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}