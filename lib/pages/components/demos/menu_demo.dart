import 'package:flutter/material.dart';
import '../../../src/menu/yg_menu.dart';

class MenuDemo extends StatelessWidget {
  const MenuDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '菜单 Menu',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '为页面和功能提供导航的菜单列表。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '垂直菜单',
          description: '子菜单内嵌在菜单区域。',
          demo: Container(
            width: 256,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: YGMenu(
              defaultSelectedKey: 'mail',
              items: [
                const YGMenuItem(
                  key: 'mail',
                  label: '邮箱',
                  icon: Icons.mail,
                ),
                const YGMenuItem(
                  key: 'calendar',
                  label: '日历',
                  icon: Icons.calendar_today,
                ),
                YGMenuSubItem(
                  key: 'settings',
                  label: '设置',
                  icon: Icons.settings,
                  children: const [
                    YGMenuItem(
                      key: 'profile',
                      label: '个人信息',
                    ),
                    YGMenuItem(
                      key: 'security',
                      label: '安全设置',
                    ),
                  ],
                ),
              ],
              onSelect: (key) {
                debugPrint('Selected: $key');
              },
            ),
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '水平菜单',
          description: '水平的顶部导航菜单。',
          demo: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: YGMenu(
              mode: YGMenuMode.horizontal,
              defaultSelectedKey: 'home',
              items: const [
                YGMenuItem(
                  key: 'home',
                  label: '首页',
                  icon: Icons.home,
                ),
                YGMenuItem(
                  key: 'products',
                  label: '产品',
                  icon: Icons.shopping_bag,
                ),
                YGMenuItem(
                  key: 'about',
                  label: '关于',
                  icon: Icons.info,
                ),
              ],
              onSelect: (key) {
                debugPrint('Selected: $key');
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDemoCard({
    required String title,
    required String description,
    required Widget demo,
  }) {
    return Card(
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: demo,
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey[200]!,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
