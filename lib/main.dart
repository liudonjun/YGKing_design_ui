import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'themes/yg_theme.dart';

void main() {
  runApp(const YGkingDesignUI());
}

class YGkingDesignUI extends StatelessWidget {
  const YGkingDesignUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YGking Design UI',
      theme: YGTheme.lightTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.getRoutes(),
    );
  }
}
