import 'package:flutter/material.dart';
import 'Confirmation_page.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  String locationText = "";
  String hospitalText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
        backgroundColor: Colors.red,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextField(
              decoration: const InputDecoration(
                labelText: "Your Location",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  locationText = value;
                });
              },
            ),

            const SizedBox(height: 12),

            TextField(
              decoration: const InputDecoration(
                labelText: "Hospital",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  hospitalText = value;
                });
              },
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  if (locationText.isNotEmpty && hospitalText.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConfirmationPage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all fields"),
                      ),
                    );
                  }

                },
                child: const Text(
                    "Confirm Hospital Location",
                  style:TextStyle(color:Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 16),


            Text(
              "Nearby Hospitals",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [

                  ListTile(
                    title: const Text("Dhaka Medical College Hospital"),
                    subtitle: const Text("Secretariat Rd, Shahbag"),

                    onTap: () {
                      setState(() {
                        hospitalText = "Dhaka Medical College Hospital";
                      });
                    },
                  ),

                  ListTile(
                    title: const Text("Square Hospital"),
                    subtitle: const Text("Panthapath, Dhaka"),
                    onTap: () {
                      setState(() {
                        hospitalText = "Square Hospital";
                      });
                    },
                  ),

                  ListTile(
                    title: const Text("United Hospital"),
                    subtitle: const Text("Gulshan 2"),
                    onTap: () {
                      setState(() {
                        hospitalText = "United Hospital";
                      });
                    },
                  ),

                  ListTile(
                    title: const Text("Evercare Hospital, Dhaka"),
                    subtitle: const Text("Plot 81, Dhaka 1229"),
                    onTap: () {
                      setState(() {
                        hospitalText = "Evercare Hospital, Dhaka";
                      });
                    },
                  ),
                  ListTile(
                    title: const Text("BIRDEM General Hospital"),
                    subtitle: const Text("Kazi Nazrul Islam Ave, Dhaka 1000"),
                    onTap: () {
                      setState(() {
                        hospitalText = "BIRDEM General Hospital";
                      });
                    },
                  ),
                  ListTile(
                    title: const Text("Kurmitola General Hospital"),
                    subtitle: const Text("Tongi Diversion Rd, Dhaka 1206"),
                    onTap: () {
                      setState(() {
                        hospitalText = "Kurmitola General Hospital";
                      });
                    },
                  ),
                  ListTile(
                    title: const Text("PG Hospital Dhaka"),
                    subtitle: const Text("Shahbagh Rd, Dhaka"),
                    onTap: () {
                      setState(() {
                        hospitalText = "PG Hospital Dhaka";
                      });
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}