import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/config/app_colors.dart';

class CurrencyText extends StatelessWidget {
  final double amount;
  final double? iconSize;
  final TextStyle? textStyle;
  final Color? iconColor;
  final bool showVat;

  const CurrencyText({
    super.key,
    required this.amount,
    this.iconSize,
    this.textStyle,
    this.iconColor,
    this.showVat = false,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // 👈 الاتجاه دايمًا من اليسار لليمين
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/sar.svg',
            width: iconSize ?? 16,
            height: iconSize ?? 16,
            colorFilter: ColorFilter.mode(
              iconColor ?? AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            amount.toStringAsFixed(2),
            style: textStyle ??
                const TextStyle(
                  fontFamily: "ExpoArabic",
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          if (showVat) ...[
            const SizedBox(width: 4),
            Text(
              "(inc. VAT)",
              style: const TextStyle(
                fontFamily: "ExpoArabic",
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
