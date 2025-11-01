import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);

    // 👇 قائمة بالخدمات التجريبية (mock)
    final services = [
      {
        'id': '1',
        'icon': Icons.home_outlined,
        'label': tr('services.home'),
        'route': '/service/1'
      },
      {
        'id': '2',
        'icon': Icons.local_laundry_service_outlined,
        'label': tr('services.laundry'),
        'route': '/service/2'
      },
      {
        'id': '3',
        'icon': Icons.cleaning_services_outlined,
        'label': tr('services.carpet'),
        'route': '/service/3'
      },
      {
        'id': '4',
        'icon': Icons.kitchen_outlined,
        'label': tr('services.kitchen'),
        'route': '/service/4'
      },
      {
        'id': '5',
        'icon': Icons.business_outlined,
        'label': tr('services.office'),
        'route': '/service/5'
      },
      {
        'id': '6',
        'icon': Icons.apartment_outlined,
        'label': tr('services.apartment'),
        'route': '/service/6'
      },
      {
        'id': '7',
        'icon': Icons.water_drop_outlined,
        'label': tr('services.deep'),
        'route': '/service/7'
      },
      {
        'id': '8',
        'icon': Icons.apps_outlined,
        'label': tr('services.more'),
        'route': '/service/8'
      },
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final s = services[index];

        return GestureDetector(
          onTap: () {
            // 👇 ينتقل إلى صفحة تفاصيل الخدمة
            context.push(s['route'] as String);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: colorPrimary.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  s['icon'] as IconData,
                  color: colorPrimary,
                  size: 26,
                ),
              ),
              const SizedBox(height: 6),
              Flexible(
                child: Text(
                  s['label'] as String,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'ExpoArabic',
                    fontSize: 12,
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
