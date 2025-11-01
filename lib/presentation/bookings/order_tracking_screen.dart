import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> steps = [
      {"title": "Order Received", "done": true},
      {"title": "Technician Assigned", "done": true},
      {"title": "On The Way", "done": true},
      {"title": "In Progress", "done": false},
      {"title": "Completed", "done": false},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Order Tracking")),
      backgroundColor: const Color(0xFFF8FAFC),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Status Updates",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  final step = steps[index];
                  final bool done = step['done'] as bool;
                  final String title = step['title'] as String;

                  return ListTile(
                    leading: Icon(
                      done ? Icons.check_circle : Icons.radio_button_unchecked,
                      color:
                      done ? const Color(0xFF2563EB) : Colors.grey.shade400,
                    ),
                    title: Text(
                      title,
                      style: TextStyle(
                        color: done ? Colors.black : Colors.grey.shade600,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
