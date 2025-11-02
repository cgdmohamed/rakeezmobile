import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookingStep1Screen extends StatefulWidget {
  final String serviceName;
  const BookingStep1Screen({super.key, required this.serviceName});

  @override
  State<BookingStep1Screen> createState() => _BookingStep1ScreenState();
}

class _BookingStep1ScreenState extends State<BookingStep1Screen> {
  int units = 1;
  bool urgent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.serviceName),
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
            const Text("Select Quantity",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 5,
                      offset: const Offset(0, 3))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () =>
                          setState(() => units = (units > 1) ? units - 1 : 1),
                      icon: const Icon(Icons.remove_circle_outline)),
                  Text('$units', style: const TextStyle(fontSize: 18)),
                  IconButton(
                      onPressed: () => setState(() => units++),
                      icon: const Icon(Icons.add_circle_outline)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Urgent Service?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Switch(
                  value: urgent,
                  onChanged: (v) => setState(() => urgent = v),
                  activeThumbColor: const Color(0xFF2563EB),
                )
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.push('/booking-step2', extra: {
                "serviceName": widget.serviceName,
                "units": units,
                "urgent": urgent
              }),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2563EB),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: const Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}
