import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {"title": "Booking Confirmed", "body": "Your AC Cleaning booking is confirmed."},
      {"title": "Technician Assigned", "body": "Ahmed will arrive at 10:00 AM."},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(item['title']!),
            subtitle: Text(item['body']!),
          );
        },
      ),
    );
  }
}
