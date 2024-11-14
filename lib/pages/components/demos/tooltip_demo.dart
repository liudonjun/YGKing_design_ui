import 'package:flutter/material.dart';
import '../../../src/tooltip/yg_tooltip.dart';
import '../../../src/buttons/yg_button.dart';

class TooltipDemo extends StatelessWidget {
  const TooltipDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '文字提示 Tooltip',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '简单的文字提示气泡框。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础用法',
          description: '最简单的用法。',
          demo: Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              YGTooltip(
                message: '提示文本',
                triggerMode: TooltipTriggerMode.tap,
                child: YGButton(
                  text: '点击提示',
                  onPressed: () {},
                ),
              ),
              YGTooltip(
                message: '长按显示提示',
                child: YGButton(
                  text: '长按提示',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义样式',
          description: '可以自定义背景颜色、文字颜色和字体大小等。',
          demo: Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              YGTooltip(
                message: '自定义颜色',
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 16,
                triggerMode: TooltipTriggerMode.tap,
                child: YGButton(
                  text: '自定义样式',
                  onPressed: () {},
                ),
              ),
              YGTooltip(
                message: '自定义内边距',
                padding: const EdgeInsets.all(16),
                triggerMode: TooltipTriggerMode.tap,
                child: YGButton(
                  text: '自定义内边距',
                  onPressed: () {},
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
