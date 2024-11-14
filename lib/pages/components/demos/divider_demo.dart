import 'package:flutter/material.dart';
import '../../../src/divider/yg_divider.dart';

class DividerDemo extends StatelessWidget {
  const DividerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '分割线 Divider',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '区隔内容的分割线。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础分割线',
          description: '默认为1px的分割线。',
          demo: Column(
            children: [
              const Text('上部分内容'),
              const SizedBox(height: 16),
              const YGDivider(),
              const SizedBox(height: 16),
              const Text('下部分内容'),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '带文字的分割线',
          description: '分割线中带有文字。',
          demo: Column(
            children: [
              const YGDivider(
                text: '分割文本',
              ),
              const SizedBox(height: 24),
              YGDivider(
                text: '自定义样式',
                color: Colors.blue[200],
                textStyle: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义样式',
          description: '可以自定义颜色和粗细。',
          demo: Column(
            children: [
              const YGDivider(
                thickness: 2,
                color: Colors.blue,
              ),
              const SizedBox(height: 16),
              YGDivider(
                thickness: 4,
                color: Colors.grey[300],
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
