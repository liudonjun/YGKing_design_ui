import 'package:flutter/material.dart';
import '../../../src/switch/yg_switch.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({Key? key}) : super(key: key);

  @override
  State<SwitchDemo> createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool switchValue1 = false;
  bool switchValue2 = true;
  bool switchValue3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '开关 Switch',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '开关选择器。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基本使用',
          description: '最简单的用法。',
          demo: YGSwitch(
            value: switchValue1,
            onChanged: (value) {
              setState(() {
                switchValue1 = value;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '不同状态',
          description: '禁用、加载中等状态。',
          demo: Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              const YGSwitch(
                value: true,
                disabled: true,
              ),
              YGSwitch(
                value: switchValue2,
                loading: true,
                onChanged: (value) {
                  setState(() {
                    switchValue2 = value;
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '带文字的开关',
          description: '带有文字描述的开关。',
          demo: YGSwitch(
            value: switchValue3,
            activeText: '开',
            inactiveText: '关',
            width: 60,
            onChanged: (value) {
              setState(() {
                switchValue3 = value;
              });
            },
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
