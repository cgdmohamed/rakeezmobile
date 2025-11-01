import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onActionTap; // 👈 علشان نقدر نربط زر "عرض الكل"

  const SectionTitle({
    super.key,
    required this.title,
    this.action,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // العنوان
          Text(
            tr(title),
            style: const TextStyle(
              fontFamily: 'ExpoArabic',
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),

          // زر "عرض الكل" أو أي أكشن آخر
          if (action != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(
                tr(action!),
                style: const TextStyle(
                  fontFamily: 'ExpoArabic',
                  color: colorPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
