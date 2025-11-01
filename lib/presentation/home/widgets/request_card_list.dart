import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../widgets/widgets.dart';

class RequestCardList extends StatelessWidget {
  const RequestCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> requests = [
      {
        'title': 'home.deep_furniture_cleaning',
        'desc': 'home.deep_furniture_desc',
        'price': '99.00',
      },
      {
        'title': 'home.facade_cleaning',
        'desc': 'home.facade_desc',
        'price': '99.00',
      },
    ];

    return Column(
      children: requests
          .map(
            (r) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _RequestCard(
            title: tr(r['title']!),
            desc: tr(r['desc']!),
            price: r['price']!,
          ),
        ),
      )
          .toList(),
    );
  }
}

class _RequestCard extends StatelessWidget {
  final String title;
  final String desc;
  final String price;

  const _RequestCard({
    required this.title,
    required this.desc,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);
    final locale = context.locale.languageCode;
    final currency = locale == 'ar' ? 'ر.س' : 'SAR';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: colorPrimary.withOpacity(0.12),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // النصوص على اليسار (أو اليمين بالعربية)
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'ExpoArabic',
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: const TextStyle(
                    fontFamily: 'ExpoArabic',
                    color: Colors.grey,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // السعر والزر على اليمين
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$price $currency',
                style: const TextStyle(
                  fontFamily: 'ExpoArabic',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 110,
                height: 34,
                child: PrimaryButton.small(
                  label: 'home.request'.tr(),
                  color: colorPrimary,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
