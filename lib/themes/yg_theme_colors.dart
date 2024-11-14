import 'package:flutter/material.dart';

class YGThemeColors {
  // 主色
  static const Color primary = Color(0xFF1890FF); // 蓝色主题
  static const Color secondary = Color(0xFF40A9FF); // 浅蓝色

  // 功能色
  static const Color success = Color(0xFF52C41A);
  static const Color warning = Color(0xFFFAAD14);
  static const Color error = Color(0xFFFF4D4F);
  static const Color info = Color(0xFF1890FF); // 使用主色

  // 中性色
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF666666);
  static const Color textDisabled = Color(0xFFBFBFBF);
  static const Color border = Color(0xFFD9D9D9);
  static const Color divider = Color(0xFFE8E8E8);
  static const Color background = Color(0xFFF0F2F5);

  // 渐变色
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF1890FF),
      Color(0xFF40A9FF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
