import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class ServiceCard extends StatelessWidget {
  final Map<String, dynamic> service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);
    final locale = context.locale.languageCode;

    return GestureDetector(
      onTap: () => context.push('/service/${service['id']}'),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: colorPrimary.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // 🖼 صورة الخدمة
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(14)),
              child: Image.asset(
                service['image'] ?? 'assets/images/service_placeholder.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            // 📋 تفاصيل الخدمة
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr(service['name'] ?? 'home.service'),
                      style: const TextStyle(
                        fontFamily: 'ExpoArabic',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      tr(service['description'] ?? 'home.service_desc'),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'ExpoArabic',
                        color: Colors.grey,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: colorPrimary,
                          padding: EdgeInsets.zero,
                          textStyle: const TextStyle(
                            fontFamily: 'ExpoArabic',
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        onPressed: () => context.push('/service/${service['id']}'),
                        child: Text(tr('home.request')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
