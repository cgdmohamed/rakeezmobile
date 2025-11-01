import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

class VerifyScreen extends ConsumerWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpCtrl = TextEditingController();
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/rakeez_logo.png', height: 80),
              const SizedBox(height: 30),
              const Text("Enter verification code", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              TextField(
                controller: otpCtrl,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: '----'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: authState.isLoading
                    ? null
                    : () async {
                  await ref.read(authStateProvider.notifier).verifyOtp(otpCtrl.text);
                  if (ref.read(authStateProvider).value == true) {
                    context.go('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid code')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: authState.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
