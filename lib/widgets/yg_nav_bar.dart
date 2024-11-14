import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import '../themes/yg_theme_colors.dart';

class YGNavBar extends StatelessWidget {
  final VoidCallback? onMenuPressed;

  const YGNavBar({
    Key? key,
    this.onMenuPressed,
  }) : super(key: key);

  void _launchGitHub() {
    html.window.open(
      'https://github.com/liudonjun/YGKing_design_ui',
      '_blank',
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 48),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: YGThemeColors.primary.withOpacity(0.1),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo
          Text(
            'YGking Design',
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              fontWeight: FontWeight.bold,
              color: YGThemeColors.primary,
            ),
          ),
          if (!isMobile) ...[
            const SizedBox(width: 48),
            // 导航链接
            _buildNavLink(context, '首页', '/'),
            _buildNavLink(context, '组件', '/components'),
            _buildNavLink(context, '文档', '/docs'),
          ],
          const Spacer(),
          // GitHub 链接
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: _launchGitHub,
            tooltip: 'GitHub',
          ),
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: onMenuPressed ??
                  () {
                    _showMobileMenu(context);
                  },
            ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('首页'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('组件'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/components');
            },
          ),
          ListTile(
            title: const Text('文档'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/docs');
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
          foregroundColor: isCurrentRoute
              ? YGThemeColors.primary
              : YGThemeColors.textPrimary,
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
