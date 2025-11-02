import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../widgets/widgets.dart';
import '../../../core/config/app_colors.dart';



class ServiceInfoCard extends StatefulWidget {
  final double price;
  final VoidCallback onBookNow;
  final VoidCallback onSchedule;

  const ServiceInfoCard({
    super.key,
    required this.price,
    required this.onBookNow,
    required this.onSchedule,
  });

  @override
  State<ServiceInfoCard> createState() => _ServiceInfoCardState();
}

class _ServiceInfoCardState extends State<ServiceInfoCard> {
  bool agreed = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('price'),
          style: const TextStyle(
            fontFamily: "ExpoArabic",
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "﷼${widget.price.toStringAsFixed(2)} (inc. VAT)",
          style: const TextStyle(
            fontFamily: "ExpoArabic",
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),

        // سياسة قطع الغيار
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF5FAFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(Icons.info_outline, color: AppColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  tr('spare_parts_policy'),
                  style: const TextStyle(
                    fontFamily: "ExpoArabic",
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        Row(
          children: [
            Checkbox(
              value: agreed,
              onChanged: (v) => setState(() => agreed = v!),
              activeColor: AppColors.primary,
            ),
            Expanded(
              child: Text(
                tr('spare_parts_agreement'),
                style: const TextStyle(fontFamily: "ExpoArabic", fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),

        PrimaryButton.large(
          label: "${tr('book_now')} ﷼${widget.price.toStringAsFixed(2)}",
          color: AppColors.primary,
          onTap: agreed ? widget.onBookNow : () {},
        ),
        const SizedBox(height: 12),
        OutlinedButtonCustom(
          label: tr('schedule'),
          color: AppColors.primary,
          onTap: widget.onSchedule,
        ),
      ],
    );
  }
}
