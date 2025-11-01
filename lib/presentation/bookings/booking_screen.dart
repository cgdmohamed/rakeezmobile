import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookingScreen extends StatefulWidget {
  final String serviceId;
  const BookingScreen({super.key, required this.serviceId});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Date & Time')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 60)),
                );
                if (date != null) setState(() => selectedDate = date);
              },
              child: Text(selectedDate == null
                  ? 'Select Date'
                  : selectedDate.toString().split(' ')[0]),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (time != null) setState(() => selectedTime = time);
              },
              child: Text(selectedTime == null
                  ? 'Select Time'
                  : selectedTime!.format(context)),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: selectedDate != null && selectedTime != null
                  ? () => context.push('/review', extra: {
                'serviceId': widget.serviceId,
                'date': selectedDate,
                'time': selectedTime
              })
                  : null,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
