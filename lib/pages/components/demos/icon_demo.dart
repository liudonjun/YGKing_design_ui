import 'package:flutter/material.dart';
import '../../../src/icon/yg_icon.dart';

class IconDemo extends StatelessWidget {
  const IconDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '图标 Icon',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '语义化的矢量图形。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基本使用',
          description: '基本的图标使用。',
          demo: Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              YGIcon(
                icon: Icons.home,
                size: 24,
                onTap: () {},
              ),
              const YGIcon(
                icon: Icons.settings,
                size: 24,
                color: Colors.blue,
              ),
              const YGIcon(
                icon: Icons.favorite,
                size: 24,
                color: Colors.red,
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '旋转动画',
          description: '可以添加旋转动画效果。',
          demo: const Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              YGIcon(
                icon: Icons.refresh,
                size: 24,
                spinning: true,
              ),
              YGIcon(
                icon: Icons.sync,
                size: 24,
                spinning: true,
                color: Colors.blue,
              ),
            ],
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
