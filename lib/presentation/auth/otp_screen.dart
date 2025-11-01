import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/widgets.dart';

class OtpScreen extends StatefulWidget {
  final String phone; // 👈 أضف ده
  const OtpScreen({super.key, required this.phone});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final colorPrimary = const Color(0xFF2563EB);
  final List<TextEditingController> _controllers =
  List.generate(4, (_) => TextEditingController());
  int _seconds = 90;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _seconds > 0) {
        setState(() => _seconds--);
        _startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                'Verify Phone',
                style: TextStyle(
                  fontFamily: "ExpoArabic",
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Verification code sent to ${widget.phone}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "ExpoArabic",
                  color: Colors.grey,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                      (i) => _OtpBox(controller: _controllers[i]),
                ),
              ),
              const SizedBox(height: 40),
              PrimaryButton.large(
                label: 'Confirm',
                color: colorPrimary,
                onTap: () => context.go('/home'),
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
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _formatTime(_seconds),
                    style: const TextStyle(
                      fontFamily: "ExpoArabic",
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _seconds == 0
                        ? () {
                      setState(() => _seconds = 90);
                      _startTimer();
                    }
                        : null,
                    child: Text(
                      'Resend',
                      style: TextStyle(
                        fontFamily: "ExpoArabic",
                        fontSize: 13,
                        color:
                        _seconds == 0 ? colorPrimary : Colors.grey.shade400,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }
}

class _OtpBox extends StatelessWidget {
  final TextEditingController controller;
  const _OtpBox({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          fontFamily: "ExpoArabic",
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: const Color(0xFFF7F8FB),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
