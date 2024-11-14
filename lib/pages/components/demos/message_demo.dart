import 'package:flutter/material.dart';
import '../../../src/message/yg_message.dart';
import '../../../src/buttons/yg_button.dart';

class MessageDemo extends StatelessWidget {
  const MessageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '全局提示 Message',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '全局展示操作反馈信息。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基本使用',
          description: '最简单的用法。',
          demo: YGButton(
            text: '显示提示',
            onPressed: () {
              YGMessage.show(
                context: context,
                content: '这是一条消息提示',
              );
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '不同类型',
          description: '不同类型的消息提示。',
          demo: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              YGButton(
                text: '成功',
                onPressed: () {
                  YGMessage.show(
                    context: context,
                    content: '操作成功',
                    type: YGMessageType.success,
                  );
                },
              ),
              YGButton(
                text: '警告',
                onPressed: () {
                  YGMessage.show(
                    context: context,
                    content: '警告信息',
                    type: YGMessageType.warning,
                  );
                },
              ),
              YGButton(
                text: '错误',
                onPressed: () {
                  YGMessage.show(
                    context: context,
                    content: '操作失败',
                    type: YGMessageType.error,
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义配置',
          description: '自定义消息提示的持续时间和关闭按钮。',
          demo: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              YGButton(
                text: '10秒后关闭',
                onPressed: () {
                  YGMessage.show(
                    context: context,
                    content: '这条消息10秒后会关闭',
                    duration: const Duration(seconds: 10),
                    showClose: true,
                  );
                },
              ),
              YGButton(
                text: '自定义图标',
                onPressed: () {
                  YGMessage.show(
                    context: context,
                    content: '带自定义图标的消息',
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 16,
                    ),
                  );
                },
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
