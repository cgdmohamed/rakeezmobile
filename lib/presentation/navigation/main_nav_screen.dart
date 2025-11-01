import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../home/home_screen.dart';
import '../bookings/booking_screen.dart';
import '../notifications/notifications_screen.dart';
import '../profile/profile_screen.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _selectedIndex = 0;

  final _pages = const [
    HomeScreen(),
    BookingScreen(serviceId: '0'),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFF1170E4);

    final labels = [
      'tabs.home'.tr(),
      'tabs.bookings'.tr(),
      'tabs.notifications'.tr(),
      'tabs.account'.tr(),
    ];

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        // ✅ الخلفية والظل هنا
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: primary.withValues( alpha: 0.12), // 👈 تحكم في لون الظل وشفافيته
              blurRadius: 15, // 👈 حجم الانتشار (كلما زاد أصبح الظل أنعم)
              offset: const Offset(0, -3), // 👈 اتجاه الظل للأعلى
            ),
          ],
        ),
        // ✅ التحكم في الارتفاع من الـ Padding
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12), // 👈 تحكم في ارتفاع الشريط
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                final isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // ✅ الشفافية المطلوبة
                      color: isSelected ? primary.withOpacity(0.12) : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _navIcons[index],
                      color: isSelected ? primary : Color(0xFF1170E4),
                      size: 26,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> get _navIcons => const [
    Icons.home_rounded,
    Icons.calendar_today_rounded,
    Icons.notifications_rounded,
    Icons.person_rounded,
  ];
}
