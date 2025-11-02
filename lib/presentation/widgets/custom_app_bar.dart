import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../core/config/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showSearchBar;
  final bool showLocation;
  final bool showBack;

  const CustomAppBar({
    super.key,
    this.title,
    this.showSearchBar = false,
    this.showLocation = false,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      titleSpacing: 0,
      leading: showBack
          ? IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.textPrimary),
        onPressed: () => Navigator.of(context).pop(),
      )
          : null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showSearchBar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: tr('search_services'),
                  prefixIcon: const Icon(Icons.search),
                  fillColor: const Color(0xFFF4F6F9),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          if (title != null && !showSearchBar)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Text(
                title!,
                style: const TextStyle(
                  fontFamily: "ExpoArabic",
                  fontSize: 18,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
      actions: [
        if (showLocation)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined, color: AppColors.primary),
                const SizedBox(width: 4),
                Text(
                  'Riyadh',
                  style: const TextStyle(
                    fontFamily: "ExpoArabic",
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
