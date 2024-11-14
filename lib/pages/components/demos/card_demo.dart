import 'package:flutter/material.dart';
import '../../../src/card/yg_card.dart';
import '../../../src/buttons/yg_button.dart';
import '../../../src/buttons/yg_button_style.dart';

class CardDemo extends StatelessWidget {
  const CardDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '卡片 Card',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '通用的容器组件，可承载文字、列表、图片等内容。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础卡片',
          description: '包含标题、内容和操作。',
          demo: YGCard(
            title: const Text('卡片标题'),
            subtitle: const Text('这是一个基础卡片的副标题'),
            child: const Text('卡片内容区域，可以放置任意内容。'),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text('取消'),
              ),
              YGButton(
                text: '确定',
                onPressed: () {},
                style: YGButtonStyle.primary,
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '带图片的卡片',
          description: '可以添加图片作为卡片的封面。',
          demo: YGCard(
            hoverable: true,
            cover: Image.network(
              'https://picsum.photos/300/200',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            title: const Text('图片标题'),
            child: const Text('这是一个带有图片封面的卡片示例。'),
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
