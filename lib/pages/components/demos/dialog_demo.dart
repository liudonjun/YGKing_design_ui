import 'package:flutter/material.dart';
import '../../../src/dialog/yg_dialog.dart';
import '../../../src/buttons/yg_button.dart';
import '../../../src/input/yg_input.dart';

class DialogDemo extends StatelessWidget {
  const DialogDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '对话框 Dialog',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '模态对话框。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础对话框',
          description: '基础的对话框用法。',
          demo: YGButton(
            text: '打开对话框',
            onPressed: () {
              YGDialog.show(
                context: context,
                title: '对话框标题',
                content: const Text('这是一个基础对话框的内容。'),
                actions: [
                  YGButton(
                    text: '取消',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  YGButton(
                    text: '确定',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '确认对话框',
          description: '快捷调用确认对话框。',
          demo: YGButton(
            text: '删除',
            onPressed: () {
              YGDialog.confirm(
                context: context,
                title: '确认删除',
                content: '确定要删除这条记录吗？',
                onOk: () {
                  debugPrint('Confirmed');
                },
              );
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义内容',
          description: '对话框可以承载更复杂的内容。',
          demo: YGButton(
            text: '自定义表单',
            onPressed: () {
              YGDialog.show(
                context: context,
                title: '编辑用户',
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const YGInput(
                      placeholder: '用户名',
                    ),
                    const SizedBox(height: 16),
                    const YGInput(
                      placeholder: '邮箱',
                    ),
                  ],
                ),
                actions: [
                  YGButton(
                    text: '取消',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  YGButton(
                    text: '保存',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              );
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
