import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorPrimary = const Color(0xFF2563EB);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              Image.asset('assets/images/rakeez_logo.png', width: 140),
              const SizedBox(height: 40),
              const Text(
                'Reset Password',
                style: TextStyle(
                  fontFamily: "ExpoArabic",
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your registered phone number or email and we’ll send you a reset code.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "ExpoArabic",
                  color: Colors.grey,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              const InputField(
                hint: 'Email / Phone',
                icon: Icons.mail_outline,
              ),
              const SizedBox(height: 32),
              PrimaryButton.large(
                label: 'Send Code',
                color: colorPrimary,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
