import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderReviewScreen extends StatelessWidget {
  final Map<String, dynamic> bookingData;
  const OrderReviewScreen({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Order"),
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFFF8FAFC),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Service: ${bookingData['serviceName']}",
                style: const TextStyle(fontSize: 16)),
            Text("Units: ${bookingData['units']}"),
            Text("Urgent: ${bookingData['urgent'] ? "Yes" : "No"}"),
            Text(
                "Date: ${(bookingData['date'] as DateTime).toLocal().toString().split(' ')[0]}"),
            Text("Time: ${(bookingData['time'] as TimeOfDay).format(context)}"),
            const Divider(height: 40),
            const Text("Total: 150 SAR",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.go('/order-complete'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text("Confirm & Pay"),
            )
          ],
        ),
      ),
    );
  }
}
