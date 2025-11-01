import 'package:flutter/material.dart';

class OfferBanner extends StatelessWidget {
  final String? imageUrl; // 👈 ممكن تكون من API أو null
  final String assetPath; // 👈 الصورة الافتراضية من assets
  final double height;
  final double borderRadius;
  final EdgeInsetsGeometry margin;

  const OfferBanner({
    super.key,
    this.imageUrl,
    this.assetPath = 'assets/images/offer_banner.png', // 👈 حط هنا صورة من عندك
    this.height = 72,
    this.borderRadius = 16,
    this.margin = const EdgeInsets.symmetric(vertical: 10),
  });

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);

    return Container(
      width: double.infinity,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: colorPrimary.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildBannerImage(),
    );
  }

  Widget _buildBannerImage() {
    if (imageUrl == null || imageUrl!.isEmpty) {
      // ✅ استخدم الصورة المحلية من الأصول
      return Image.asset(
        assetPath,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }

    // ✅ استخدم الصورة من الإنترنت لما تتوفر
    return Image.network(
      imageUrl!,
      fit: BoxFit.cover,
      width: double.infinity,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(
          child: CircularProgressIndicator(
            color: Color(0xFF1170E4),
            strokeWidth: 2.5,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        // لو الصورة من السيرفر فشلت، نرجع لصورة الـ assets
        return Image.asset(
          assetPath,
          fit: BoxFit.cover,
          width: double.infinity,
        );
      },
    );
  }
}
