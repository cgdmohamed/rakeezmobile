import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/widgets.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

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
          'My Addresses',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Map Preview
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/map_placeholder.png', // استبدلها بخريطة فعلية لاحقًا
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),

            // Confirm button
            PrimaryButton.large(
              label: 'Confirm',
              color: colorPrimary,
              onTap: () {},
            ),

            const SizedBox(height: 12),

            GestureDetector(
              onTap: () => context.go('/add-address'),
              child: const Text(
                'Enter manually',
                style: TextStyle(
                  fontFamily: 'ExpoArabic',
                  fontSize: 13,
                  color: Color(0xFF1170E4),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Addresses section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'My Addresses',
                style: TextStyle(
                  fontFamily: 'ExpoArabic',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Address Cards
            Row(
              children: [
                Expanded(
                  child: _AddressCard(
                    title: 'Home',
                    details: '33211\nBander Bin Abdulaziz St\nAl Andalus\nRiyadh',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _AddNewCard(
                    onTap: () => context.go('/add-address'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final String title;
  final String details;
  final VoidCallback onTap;

  const _AddressCard({
    required this.title,
    required this.details,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);

    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'ExpoArabic',
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              details,
              style: const TextStyle(
                fontFamily: 'ExpoArabic',
                color: Colors.grey,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AddNewCard extends StatelessWidget {
  final VoidCallback onTap;

  const _AddNewCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    const colorPrimary = Color(0xFF1170E4);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Center(
          child: Icon(Icons.add, color: colorPrimary, size: 32),
        ),
      ),
    );
  }
}
