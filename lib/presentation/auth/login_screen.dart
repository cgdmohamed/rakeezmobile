import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                'Login',
                style: TextStyle(
                  fontFamily: "ExpoArabic",
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Cleaning Service is here to keep your home, office, or apartment clean with trusted and professional cleaners.',
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
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              const InputField(
                hint: 'Password',
                icon: Icons.lock_outline,
                obscureText: true,
              ),
              const SizedBox(height: 32),
              PrimaryButton.large(
                label: 'Login',
                color: colorPrimary,
                onTap: () => context.go('/otp') ,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontFamily: "ExpoArabic",
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.push('/forgot'),
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontFamily: "ExpoArabic",
                        fontSize: 13,
                        color: colorPrimary,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              // 👇 الزر الجديد لتسجيل حساب جديد
              OutlinedButtonCustom(
                label: 'Create Account',
                color: colorPrimary,
                onTap: () => context.push('/register'),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
