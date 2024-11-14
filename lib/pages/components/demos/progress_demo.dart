import 'package:flutter/material.dart';
import '../../../src/progress/yg_progress.dart';

class ProgressDemo extends StatelessWidget {
  const ProgressDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '进度条 Progress',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '展示操作的当前进度。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基本使用',
          description: '标准的进度条。',
          demo: Column(
            children: [
              const YGProgress(
                percent: 30,
                width: 300,
              ),
              const SizedBox(height: 16),
              YGProgress(
                percent: 70,
                width: 300,
                format: (value) => '${value.toStringAsFixed(1)}分',
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '进度圈',
          description: '圆形的进度条。',
          demo: Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              const YGProgress(
                type: YGProgressType.circle,
                percent: 75,
                size: 80,
              ),
              YGProgress(
                type: YGProgressType.circle,
                percent: 100,
                status: YGProgressStatus.success,
                size: 80,
                format: (value) => '完成',
              ),
              const YGProgress(
                type: YGProgressType.circle,
                percent: 50,
                status: YGProgressStatus.error,
                size: 80,
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
