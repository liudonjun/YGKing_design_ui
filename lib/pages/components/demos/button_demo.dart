import 'package:flutter/material.dart';
import '../../../src/buttons/yg_button.dart';
import '../../../src/buttons/yg_button_style.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '按钮 Button',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '按钮用于开始一个即时操作。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '按钮类型',
          description: 'YGking Design 为您提供了五种按钮类型',
          demo: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              YGButton(
                text: '主要按钮',
                onPressed: () {},
                style: YGButtonStyle.primary,
              ),
              YGButton(
                text: '次要按钮',
                onPressed: () {},
                style: YGButtonStyle.secondary,
              ),
              YGButton(
                text: '文本按钮',
                onPressed: () {},
                style: YGButtonStyle.text,
              ),
              YGButton(
                text: '危险按钮',
                onPressed: () {},
                style: YGButtonStyle.danger,
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
