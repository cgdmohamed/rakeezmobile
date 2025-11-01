import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReviewScreen extends StatelessWidget {
  final Map<String, dynamic> bookingData;
  const ReviewScreen({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Review Order')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text('Service ID: ${bookingData['serviceId']}'),
            Text('Date: ${bookingData['date']}'),
            Text('Time: ${bookingData['time']}'),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.push('/success'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Confirm & Pay'),
            ),
          ],
        ),
      ),
    );
  }
}
