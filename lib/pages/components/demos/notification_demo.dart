import 'package:flutter/material.dart';
import '../../../src/notification/yg_notification.dart';
import '../../../src/buttons/yg_button.dart';

class NotificationDemo extends StatelessWidget {
  const NotificationDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '通知提醒框 Notification',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '全局展示通知提醒信息。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基本用法',
          description: '最简单的用法。',
          demo: YGButton(
            text: '显示通知',
            onPressed: () {
              YGNotification.show(
                context: context,
                title: '这是一条通知',
                description: '这是通知的详细描述信息。',
              );
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '不同类型',
          description: '不同类型的通知。',
          demo: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              YGButton(
                text: '成功',
                onPressed: () {
                  YGNotification.show(
                    context: context,
                    title: '操作成功',
                    description: '数据已成功保存。',
                    type: YGNotificationType.success,
                  );
                },
              ),
              YGButton(
                text: '警告',
                onPressed: () {
                  YGNotification.show(
                    context: context,
                    title: '警告提示',
                    description: '请注意系统安全。',
                    type: YGNotificationType.warning,
                  );
                },
              ),
              YGButton(
                text: '错误',
                onPressed: () {
                  YGNotification.show(
                    context: context,
                    title: '错误提示',
                    description: '服务器发生错误。',
                    type: YGNotificationType.error,
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义图标',
          description: '可以自定义通知图标。',
          demo: YGButton(
            text: '自定义图标',
            onPressed: () {
              YGNotification.show(
                context: context,
                title: '自定义图标',
                description: '使用自定义的图标。',
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 20,
                ),
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
