import 'package:flutter/material.dart';

/// حقل إدخال نصوص موحد التصميم
class InputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscureText;

  const InputField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey),
      ),
    );
  }
}


class PrimaryButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  /// يمكنك تحديد ارتفاع الزر أو استخدام الأنماط الجاهزة
  final double? height;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.color,
    required this.onTap,
    this.height,
    this.fontSize,
    this.padding,
  });

  factory PrimaryButton.small({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) =>
      PrimaryButton(
        label: label,
        color: color,
        onTap: onTap,
        height: 34,
        fontSize: 13,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
      );

  factory PrimaryButton.medium({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) =>
      PrimaryButton(
        label: label,
        color: color,
        onTap: onTap,
        height: 44,
        fontSize: 15,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      );

  factory PrimaryButton.large({
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) =>
      PrimaryButton(
        label: label,
        color: color,
        onTap: onTap,
        height: 52,
        fontSize: 16,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height, // 👈 لو محددة تُستخدم، لو لا يعتمد على الـ padding
        width: double.infinity,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.25),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          label.isNotEmpty ? label : '-',
          style: TextStyle(
            fontFamily: "ExpoArabic",
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: fontSize ?? 14,
            height: 1.1,
          ),
        ),
      ),
    );
  }
}


/// زر مفرغ بإطار
class OutlinedButtonCustom extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const OutlinedButtonCustom({
    super.key,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.hasBoundedWidth
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: color, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "ExpoArabic",
                      color: color,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
