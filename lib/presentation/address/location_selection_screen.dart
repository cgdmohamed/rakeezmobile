import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/widgets.dart';


class LocationSelectionScreen extends StatelessWidget {
  const LocationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorPrimary = const Color(0xFF1170E4);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/map_placeholder.png',
                  height: 500,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              PrimaryButton.large(
                label: 'Confirm',
                color: colorPrimary,
                onTap: () => context.go('/addresses'),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => context.go('/add-address'),
                child: Text(
                  'Enter manually',
                  style: TextStyle(
                    fontFamily: "ExpoArabic",
                    color: colorPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
