import 'package:flutter/material.dart';
import '../../../src/badge/yg_badge.dart';
import '../../../src/tooltip/yg_tooltip.dart';

class BadgeDemo extends StatelessWidget {
  const BadgeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '徽章 Badge',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '图标右上角的圆形徽标数字。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础用法',
          description: '简单的徽章展示。',
          demo: Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              YGBadge(
                count: '5',
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey[200],
                ),
              ),
              YGBadge(
                dot: true,
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义样式',
          description: '自定义徽章的样式。',
          demo: Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              YGBadge(
                count: '99+',
                color: Colors.blue,
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.grey[200],
                ),
              ),
              YGTooltip(
                message: '自定义提示文本',
                triggerMode: TooltipTriggerMode.tap,
                child: YGBadge(
                  count: 'NEW',
                  color: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Colors.grey[200],
                  ),
                ),
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
