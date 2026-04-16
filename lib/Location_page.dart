import 'package:flutter/material.dart';
import 'Confirmation_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController locationController = TextEditingController();
  final TextEditingController hospitalController = TextEditingController();

  final List<Map<String, String>> hospitals = [
    {
      "name": "Dhaka Medical College Hospital",
      "address": "Secretariat Rd, Shahbag"
    },
    {
      "name": "Square Hospital",
      "address": "Panthapath, Dhaka"
    },
    {
      "name": "United Hospital",
      "address": "Gulshan 2"
    },
    {
      "name": "Evercare Hospital, Dhaka",
      "address": "Plot 81, Dhaka 1229"
    },
    {
      "name": "BIRDEM General Hospital",
      "address": "Kazi Nazrul Islam Ave, Dhaka 1000"
    },
    {
      "name": "Kurmitola General Hospital",
      "address": "Tongi Diversion Rd, Dhaka 1206"
    },
    {
      "name": "PG Hospital Dhaka",
      "address": "Shahbagh Rd, Dhaka"
    },
  ];

  @override
  void dispose() {
    locationController.dispose();
    hospitalController.dispose();
    super.dispose();
  }

  void _confirmLocation() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ConfirmationPage(),
        ),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) =>
      value == null || value.isEmpty ? "This field is required" : null,
    );
  }

  Widget _buildHospitalTile(Map<String, String> hospital) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(hospital["name"]!),
        subtitle: Text(hospital["address"]!),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          setState(() {
            hospitalController.text = hospital["name"]!;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(
                label: "Your Location",
                controller: locationController,
              ),
              const SizedBox(height: 12),
              _buildTextField(
                label: "Hospital",
                controller: hospitalController,
              ),
              const SizedBox(height: 16),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _confirmLocation,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Confirm Hospital Location",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nearby Hospitals",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// Hospital List
              Expanded(
                child: ListView.builder(
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    return _buildHospitalTile(hospitals[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}