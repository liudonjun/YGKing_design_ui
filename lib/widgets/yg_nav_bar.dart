import 'package:flutter/material.dart';

class YGNavBar extends StatelessWidget {
  const YGNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 48),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo
          const Text(
            'YGking Design',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1890FF),
            ),
          ),
          const SizedBox(width: 48),
          // 导航链接
          _buildNavLink(context, '首页', '/'),
          _buildNavLink(context, '组件', '/components'),
          _buildNavLink(context, '文档', '/docs'),
          const Spacer(),
          // GitHub 链接
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: () {
              // TODO: 添加 GitHub 链接
            },
          ),
        ],
      ),
    );
  }

  Widget _buildNavLink(BuildContext context, String title, String route) {
    final bool isCurrentRoute = ModalRoute.of(context)?.settings.name == route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextButton(
        onPressed: () {
          if (!isCurrentRoute) {
            Navigator.pushNamed(context, route);
          }
        },
        style: TextButton.styleFrom(
          foregroundColor:
              isCurrentRoute ? const Color(0xFF1890FF) : Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
