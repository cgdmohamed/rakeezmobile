import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PackageCard extends StatelessWidget {
  final Map<String, dynamic> package;
  const PackageCard({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);
    final locale = context.locale.languageCode;
    final currency = locale == 'ar' ? 'ر.س' : 'SAR';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorPrimary.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // عنوان الباقة
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                package['name'] ?? tr('home.package_default_name'),
                style: const TextStyle(
                  fontFamily: 'ExpoArabic',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${package['price'] ?? 0} $currency",
                style: const TextStyle(
                  fontFamily: 'ExpoArabic',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          // السهم
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: colorPrimary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: colorPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
