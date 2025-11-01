import 'package:flutter/material.dart';

class BookingUtils {
  static Future<DateTime?> pickDateTime(BuildContext context) async {
    final now = DateTime.now();

    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year, now.month + 3),
    );

    if (date == null) return null;

    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return null;

    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  static void mockBooking(String serviceName, DateTime dateTime) {
    debugPrint(
        "📅 Booking confirmed for $serviceName on ${dateTime.toIso8601String()}");
  }
}
