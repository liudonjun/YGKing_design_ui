import 'package:flutter/material.dart';
import 'yg_button_style.dart';

class YGButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final YGButtonStyle style;

  const YGButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.style = YGButtonStyle.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: _getButtonStyle(),
      child: Text(text),
    );
  }

  ButtonStyle _getButtonStyle() {
    switch (style) {
      case YGButtonStyle.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1890FF),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        );
      case YGButtonStyle.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF1890FF),
          side: const BorderSide(color: Color(0xFF1890FF)),
        );
      // 其他样式实现...
      default:
        return ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1890FF),
          foregroundColor: Colors.white,
        );
    }
  }
}
