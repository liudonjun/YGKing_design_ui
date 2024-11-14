import 'package:flutter/material.dart';
import '../../../src/avatar/yg_avatar.dart';

class AvatarDemo extends StatelessWidget {
  const AvatarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '头像 Avatar',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '用来代表用户或事物，支持图片、图标或字符展示。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基本用法',
          description: '头像的基本使用。',
          demo: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              const YGAvatar(
                imageUrl: 'https://picsum.photos/200',
                size: YGAvatarSize.large,
              ),
              YGAvatar(
                icon: const Icon(Icons.person),
                backgroundColor: const Color(0xFF1890FF),
              ),
              YGAvatar(
                text: 'YG',
                backgroundColor: const Color(0xFF722ED1),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '不同尺寸',
          description: '头像有大、中、小三种尺寸。',
          demo: Wrap(
            spacing: 16,
            runSpacing: 16,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const YGAvatar(
                text: 'L',
                size: YGAvatarSize.large,
                backgroundColor: Color(0xFF1890FF),
              ),
              const YGAvatar(
                text: 'M',
                size: YGAvatarSize.medium,
                backgroundColor: Color(0xFF1890FF),
              ),
              const YGAvatar(
                text: 'S',
                size: YGAvatarSize.small,
                backgroundColor: Color(0xFF1890FF),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '形状',
          description: '支持圆形和方形两种形状。',
          demo: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              const YGAvatar(
                imageUrl: 'https://picsum.photos/200',
                size: YGAvatarSize.large,
              ),
              const YGAvatar(
                imageUrl: 'https://picsum.photos/200',
                size: YGAvatarSize.large,
                shape: BoxShape.rectangle,
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
