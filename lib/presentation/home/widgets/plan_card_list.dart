import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PlanCardList extends StatelessWidget {
  const PlanCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> plans = [
      {
        'title': 'home.basic_package',
        'features': [
          'home.2_rooms',
          'home.1_bathroom',
          'home.kitchen',
          'home.1_car'
        ],
        'price': '99.00',
        'highlight': false,
      },
      {
        'title': 'home.premium_package',
        'features': [
          'home.full_apartment',
          'home.2_visits_weekly',
          'home.3_cars',
          'home.garden'
        ],
        'price': '199.00',
        'highlight': true,
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: plans.map((plan) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _PlanCard(
              title: tr(plan['title'].toString()),
              features: (plan['features'] as List<String>)
                  .map((f) => tr(f))
                  .toList(),
              price: plan['price'].toString(),
              highlight: plan['highlight'] as bool,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String title;
  final List<String> features;
  final String price;
  final bool highlight;

  const _PlanCard({
    required this.title,
    required this.features,
    required this.price,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);
    final locale = context.locale.languageCode;
    final currency = locale == 'ar' ? 'ر.س' : 'SAR';

    final bgColor = highlight ? colorPrimary : Colors.white;
    final textColor = highlight ? Colors.white : Colors.black87;

    return Container(
      width: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorPrimary.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'ExpoArabic',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),
          ...features.map(
                (f) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '✔ $f',
                style: TextStyle(
                  fontFamily: 'ExpoArabic',
                  color: textColor.withOpacity(0.9),
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '$currency $price / ${tr('home.month')}',
            style: TextStyle(
              fontFamily: 'ExpoArabic',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
