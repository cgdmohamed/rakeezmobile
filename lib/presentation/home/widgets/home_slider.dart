import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeSlider extends StatefulWidget {
  final double? height; // 👈 عشان تتحكم في الارتفاع
  final EdgeInsetsGeometry? margin; // 👈 عشان تتحكم في الهوامش الجانبية

  const HomeSlider({
    super.key,
    this.height,
    this.margin,
  });

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int _current = 0;

  final List<String> banners = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider.builder(
          itemCount: banners.length,
          options: CarouselOptions(
            height: widget.height ?? 160, // 👈 تقدر تتحكم من الاستدعاء
            viewportFraction: 1.0, // 👈 كده بياخد العرض كامل بدون فراغات
            enlargeCenterPage: false, // 👈 إلغاء التكبير الجانبي
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayCurve: Curves.easeInOut,
            onPageChanged: (index, reason) {
              if (!mounted) return;
              setState(() => _current = index);
            },
          ),
          itemBuilder: (context, index, _) {
            return Container(
              margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: 0), // 👈 تحكم حر في المسافات
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: colorPrimary.withOpacity(0.08),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  banners[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(banners.length, (i) {
            final bool isActive = i == _current;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isActive ? 20 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isActive ? colorPrimary : colorPrimary.withOpacity(0.3),
              ),
            );
          }),
        ),
      ],
    );
  }
}
