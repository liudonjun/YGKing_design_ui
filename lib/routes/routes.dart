import 'package:flutter/material.dart';
import '../pages/home/home_page.dart';
import '../pages/components/components_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String components = '/components';
  static const String docs = '/docs';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => const HomePage(),
      components: (context) => const ComponentsPage(),
      // 后续添加其他路由
    };
  }
}
