import 'package:flutter/material.dart';
import '../../../src/input/yg_input.dart';

class InputDemo extends StatelessWidget {
  const InputDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '输入框 Input',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '通过鼠标或键盘输入内容，是最基础的表单域的包装。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基本使用',
          description: '基本使用方式',
          demo: Column(
            children: [
              const YGInput(
                placeholder: '请输入内容',
              ),
              const SizedBox(height: 16),
              YGInput(
                placeholder: '带图标的输入框',
                prefix: const Icon(Icons.search, size: 20),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '不同状态',
          description: '输入框的不同状态',
          demo: Column(
            children: [
              const YGInput(
                placeholder: '禁用状态',
                disabled: true,
              ),
              const SizedBox(height: 16),
              YGInput(
                placeholder: '错误状态',
                errorText: '请输入正确的内容',
              ),
              const SizedBox(height: 16),
              const YGInput(
                placeholder: '只读状态',
                readOnly: true,
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
