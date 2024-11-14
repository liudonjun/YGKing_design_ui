import 'package:flutter/material.dart';
import '../../../src/tag/yg_tag.dart';

class TagDemo extends StatelessWidget {
  const TagDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '标签 Tag',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '进行标记和分类的小标签。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础用法',
          description: '基础标签的用法。',
          demo: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const YGTag(text: '标签'),
              const YGTag(
                text: '链接标签',
                type: YGTagType.primary,
              ),
              const YGTag(
                text: '成功标签',
                type: YGTagType.success,
              ),
              const YGTag(
                text: '警告标签',
                type: YGTagType.warning,
              ),
              const YGTag(
                text: '错误标签',
                type: YGTagType.danger,
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '可关闭标签',
          description: '点击标签可以关闭。',
          demo: StatefulBuilder(
            builder: (context, setState) {
              List<String> tags = ['标签1', '标签2', '标签3'];
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tags.map((tag) {
                  return YGTag(
                    text: tag,
                    closable: true,
                    onClose: () {
                      setState(() {
                        tags.remove(tag);
                      });
                    },
                  );
                }).toList(),
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
