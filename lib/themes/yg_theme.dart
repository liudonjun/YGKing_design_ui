import 'package:flutter/material.dart';

class YGTheme {
  static const Color primaryColor = Color(0xFF1890FF);
  static const Color secondaryColor = Color(0xFF722ED1);
  static const Color successColor = Color(0xFF52C41A);
  static const Color warningColor = Color(0xFFFADB14);
  static const Color errorColor = Color(0xFFF5222D);

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      useMaterial3: true,
    );
  }
}
