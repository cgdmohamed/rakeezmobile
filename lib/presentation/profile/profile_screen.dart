import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);
    const background = Color(0xFFF8FAFF);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'ExpoArabic',
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assets/images/user_placeholder.png'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Mohamed Mostafa',
              style: TextStyle(
                fontFamily: 'ExpoArabic',
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const Text(
              'mohamed@email.com',
              style: TextStyle(
                fontFamily: 'ExpoArabic',
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 24),
            Divider(color: Colors.grey.shade300, height: 32),

            // Options
            _ProfileTile(
              icon: Icons.person_outline,
              label: 'Account Information',
              onTap: () => context.go('/edit-profile'),
            ),
            _ProfileTile(
              icon: Icons.calendar_today_outlined,
              label: 'My Booking',
              onTap: () => context.go('/booking-step1/ac'),
            ),
            _ProfileTile(
              icon: Icons.history,
              label: 'Addresses',
              onTap: () => context.go('/addresses'),
            ),
            _ProfileTile(
              icon: Icons.credit_card_outlined,
              label: 'Payment Method',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.settings_outlined,
              label: 'Setting',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.headset_mic_outlined,
              label: 'Support',
              onTap: () => context.go('/support'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ProfileTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorPrimary.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: Icon(icon, color: colorPrimary, size: 20),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontFamily: 'ExpoArabic',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.black38, size: 18),
          ],
        ),
      ),
    );
  }
}
