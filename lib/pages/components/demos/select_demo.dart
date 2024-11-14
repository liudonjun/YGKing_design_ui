import 'package:flutter/material.dart';
import '../../../src/select/yg_select.dart';

class SelectDemo extends StatefulWidget {
  const SelectDemo({Key? key}) : super(key: key);

  @override
  State<SelectDemo> createState() => _SelectDemoState();
}

class _SelectDemoState extends State<SelectDemo> {
  String? value1;
  String? value2;
  String? value3;

  final List<YGSelectOption> options = const [
    YGSelectOption(value: 'option1', label: '选项一'),
    YGSelectOption(value: 'option2', label: '选项二'),
    YGSelectOption(value: 'option3', label: '选项三'),
    YGSelectOption(value: 'option4', label: '选项四', disabled: true),
    YGSelectOption(value: 'option5', label: '选项五'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '选择器 Select',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '下拉选择器。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础用法',
          description: '基础的选择器用法。',
          demo: YGSelect(
            options: options,
            value: value1,
            onChanged: (value) {
              setState(() {
                value1 = value;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '可清空',
          description: '包含清空按钮。',
          demo: YGSelect(
            options: options,
            value: value2,
            clearable: true,
            onChanged: (value) {
              setState(() {
                value2 = value;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '带搜索',
          description: '可搜索选项。',
          demo: YGSelect(
            options: options,
            value: value3,
            searchable: true,
            clearable: true,
            onChanged: (value) {
              setState(() {
                value3 = value;
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
