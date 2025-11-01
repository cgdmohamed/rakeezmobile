import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/widgets.dart';



class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorPrimary = const Color(0xFF1170E4);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search + City Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for services...',
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: const Color(0xFFF7F8FB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Color(0xFF1170E4)),
                      const SizedBox(width: 4),
                      const Text(
                        'Riyadh',
                        style: TextStyle(
                          fontFamily: "ExpoArabic",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                'Add Address',
                style: TextStyle(
                  fontFamily: "ExpoArabic",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),

              const InputField(hint: 'Address name', icon: Icons.home_outlined),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(child: InputField(hint: 'Street name', icon: Icons.map_outlined)),
                  SizedBox(width: 12),
                  Expanded(child: InputField(hint: 'House No.', icon: Icons.home_work_outlined)),
                ],
              ),
              const SizedBox(height: 16),
              const InputField(hint: 'District / Area', icon: Icons.location_city_outlined),
              const SizedBox(height: 16),
              const InputField(hint: 'Directions / Notes', icon: Icons.note_outlined),
              const SizedBox(height: 20),

              // Radio Buttons
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Home', style: TextStyle(fontFamily: "ExpoArabic")),
                      value: 'Home',
                      groupValue: 'Home',
                      onChanged: (_) {},
                      activeColor: colorPrimary,
                      dense: true,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Office', style: TextStyle(fontFamily: "ExpoArabic")),
                      value: 'Office',
                      groupValue: '',
                      onChanged: (_) {},
                      activeColor: colorPrimary,
                      dense: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              PrimaryButton.large(
                label: 'Confirm',
                color: colorPrimary,
                onTap: () => context.go('/addresses'),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => context.go('/location'),
                child: Text(
                  'Back to map selection',
                  style: TextStyle(
                    fontFamily: "ExpoArabic",
                    color: colorPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
