import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  List<Map<String, dynamic>> notifications = [
    {
      "title": "Ambulance Requested",
      "subtitle": "Your ambulance request has been sent",
      "time": "2 min ago",
      "isRead": false,
    },
    {
      "title": "Ambulance On The Way",
      "subtitle": "Driver is coming to your location",
      "time": "10 min ago",
      "isRead": false,
    },
    {
      "title": "Payment Successful",
      "subtitle": "Your payment has been completed",
      "time": "1 hour ago",
      "isRead": true,
    },
    {
      "title": "Hospital Selected",
      "subtitle": "You selected Square Hospital",
      "time": "Yesterday",
      "isRead": true,
    },
  ];

  void markAllAsRead() {
    setState(() {
      for (var n in notifications) {
        n["isRead"] = true;
      }
    });
  }

  Widget buildNotificationTile(Map<String, dynamic> notif) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
          notif["isRead"] ? Colors.grey[300] : Colors.red[100],
          child: Icon(
            Icons.notifications,
            color: notif["isRead"] ? Colors.grey : Colors.red,
          ),
        ),
        title: Text(
          notif["title"],
          style: TextStyle(
            fontWeight:
            notif["isRead"] ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(notif["subtitle"]),
        trailing: Text(
          notif["time"],
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        onTap: () {
          setState(() {
            notif["isRead"] = true;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recent = notifications
        .where((n) => n["time"].toString().contains("min"))
        .toList();

    final earlier = notifications
        .where((n) => !n["time"].toString().contains("min"))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: markAllAsRead,
            child: const Text(
              "Mark all",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),

      body: notifications.isEmpty
          ? const Center(
        child: Text(
          "No Notifications",
          style: TextStyle(fontSize: 16),
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(12),
        child: ListView(
          children: [

            /// Recent Section
            if (recent.isNotEmpty) ...[
              const Text(
                "Recent",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...recent.map(buildNotificationTile),
              const SizedBox(height: 16),
            ],

            /// Earlier Section
            if (earlier.isNotEmpty) ...[
              const Text(
                "Earlier",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ...earlier.map(buildNotificationTile),
            ],
          ],
        ),
      ),
    );
  }
}