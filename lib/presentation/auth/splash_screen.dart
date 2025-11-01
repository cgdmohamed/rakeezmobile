import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // بعد تحميل الصفحة بثانيتين، ينتقل للصفحة التالية
    Future.delayed(const Duration(seconds: 2), () {
      context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🔵 الخلفية (الصورة الكاملة)
          Image.asset(
            'assets/images/splash_bg.png',
            fit: BoxFit.cover,
          ),

          // ⚪ الطبقة الشفافة الزرقاء (مثل التصميم)
          Container(
            color: const Color(0xFF2563EB).withOpacity(0.4),
          ),

          // 🔷 الشعار + اللودر
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Spacer(),
              // الشعار مدمج داخل الصورة، ممكن تتركه فارغ أو تضيف نسخة نصية
              SizedBox(height: 60),
              Spacer(),
              CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2.5,
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
