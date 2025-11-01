import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'widgets/service_info_card.dart';
import '../../core/utils/booking_utils.dart';


class ServiceDetailScreen extends StatelessWidget {
  final String id;
  const ServiceDetailScreen({super.key, required this.id});


  @override
  Widget build(BuildContext context) {
    final String serviceName = tr('ac_deep_cleaning'); // عنوان الخدمة
    final String serviceDescription = tr('ac_cleaning_description');
    final double servicePrice = 99.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(tr('service_details'),
            style: const TextStyle(
                fontFamily: "ExpoArabic", fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/ac_cleaning.jpg',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // تفاصيل الخدمة
            Text(
              serviceName,
              style: const TextStyle(
                fontFamily: "ExpoArabic",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text(
                  "4.5/5 (120 reviews)",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              serviceDescription,
              style: const TextStyle(
                fontFamily: "ExpoArabic",
                color: Colors.black87,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),

            // مميزات الخدمة
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFF3FDF6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.verified, color: Colors.green),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      tr('warranty_message'),
                      style: const TextStyle(
                        fontFamily: "ExpoArabic",
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // عناصر الخدمة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconText(Icons.shield_outlined, tr('service_guarantee')),
                _iconText(Icons.verified_user_outlined, tr('quality_assured')),
                _iconText(Icons.account_balance_wallet_outlined, tr('peace_of_mind')),
              ],
            ),
            const SizedBox(height: 20),

            // السعر والزرار
            ServiceInfoCard(
              price: servicePrice,
              onBookNow: () {
                final bookingDate = DateTime.now();
                BookingUtils.mockBooking(serviceName, bookingDate);
                context.push('/checkout/$id');
              },
              onSchedule: () async {
                final selectedDateTime = await BookingUtils.pickDateTime(context);
                if (selectedDateTime != null) {
                  BookingUtils.mockBooking(serviceName, selectedDateTime);
                  context.push('/checkout/$id');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconText(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F8FB),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.blueAccent),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontFamily: "ExpoArabic",
            fontSize: 13,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
