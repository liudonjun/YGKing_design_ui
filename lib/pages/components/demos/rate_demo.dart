import 'package:flutter/material.dart';
import '../../../src/rate/yg_rate.dart';

class RateDemo extends StatefulWidget {
  const RateDemo({Key? key}) : super(key: key);

  @override
  State<RateDemo> createState() => _RateDemoState();
}

class _RateDemoState extends State<RateDemo> {
  double value1 = 0;
  double value2 = 2.5;
  double value3 = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '评分 Rate',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '评分组件。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基本用法',
          description: '最简单的用法。',
          demo: YGRate(
            value: value1,
            onChange: (value) {
              setState(() {
                value1 = value;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '半星',
          description: '支持选择半星。',
          demo: YGRate(
            value: value2,
            allowHalf: true,
            onChange: (value) {
              setState(() {
                value2 = value;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义样式',
          description: '可以自定义星星大小、颜色和图标。',
          demo: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YGRate(
                value: value3,
                onChange: (value) {
                  setState(() {
                    value3 = value;
                  });
                },
                size: 32,
                activeColor: Colors.red,
              ),
              const SizedBox(height: 16),
              YGRate(
                value: value3,
                onChange: (value) {
                  setState(() {
                    value3 = value;
                  });
                },
                character: Icons.favorite,
                activeColor: Colors.pink,
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
