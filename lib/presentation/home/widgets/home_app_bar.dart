import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/config/app_colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.RTL;
    final walletLabel = tr('wallet_balance');
    final topUpLabel = tr('top_up');
    final locationLabel = 'Riyadh'; // ممكن لاحقًا تجي من provider

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 120,
      titleSpacing: 16,
      centerTitle: false,
      title: Column(
        crossAxisAlignment:
        isRTL ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          // 🔍 Search + Location
          Row(
            textDirection: Directionality.of(context),
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F6F9),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      Expanded(
                        child: TextField(
                          textAlign:
                          isRTL ? TextAlign.right : TextAlign.left,
                          decoration: InputDecoration(
                            hintText: tr('search_services'),
                            hintStyle: const TextStyle(
                              fontFamily: "ExpoArabic",
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Row(
                textDirection: Directionality.of(context),
                children: [
                  const Icon(Icons.location_on_outlined,
                      color: AppColors.primary),
                  const SizedBox(width: 4),
                  Text(
                    locationLabel,
                    style: const TextStyle(
                      fontFamily: "ExpoArabic",
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down,
                      size: 18, color: Colors.black54),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 👛 Wallet + Top-up
          Row(
            textDirection: Directionality.of(context),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                textDirection: Directionality.of(context),
                children: [
                  SvgPicture.asset(
                    'assets/icons/wallet.svg',
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                        AppColors.primary, BlendMode.srcIn),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$walletLabel:',
                    style: const TextStyle(
                      fontFamily: "ExpoArabic",
                      fontSize: 14,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '125 SAR',
                    style: const TextStyle(
                      fontFamily: "ExpoArabic",
                      fontSize: 14,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF3FE),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  textDirection: Directionality.of(context),
                  children: [
                    Text(
                      topUpLabel,
                      style: const TextStyle(
                        fontFamily: "ExpoArabic",
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 6),
                    SvgPicture.asset(
                      'assets/icons/topup.svg',
                      width: 16,
                      height: 16,
                      colorFilter: const ColorFilter.mode(
                          AppColors.primary, BlendMode.srcIn),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
