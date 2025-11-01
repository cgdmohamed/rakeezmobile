import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                'Register',
                style: TextStyle(
                  fontFamily: "ExpoArabic",
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Creating out of your home a clean and clear environment.',
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
                hint: 'Your name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              const InputField(
                hint: 'Email',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
              const InputField(
                hint: '+966',
                icon: Icons.phone_outlined,
              ),
              const SizedBox(height: 16),
              const InputField(
                hint: 'Password',
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              const SizedBox(height: 32),
              PrimaryButton.large(
                label: 'Create Account',
                color: colorPrimary,
                onTap: () {},
              ),
              const SizedBox(height: 16),
              OutlinedButtonCustom(
                label: 'Go Back',
                color: colorPrimary,
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/login');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
