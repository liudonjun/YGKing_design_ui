import 'package:flutter/material.dart';
import '../../../src/timeline/yg_timeline.dart';
import '../../../src/card/yg_card.dart';

class TimelineDemo extends StatelessWidget {
  const TimelineDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '时间轴 Timeline',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '垂直展示的时间流信息。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础用法',
          description: '基础的时间轴。',
          demo: YGTimeline(
            items: [
              YGTimelineItem(
                label: '2024-03-01',
                content: const Text('创建项目'),
              ),
              YGTimelineItem(
                label: '2024-03-02',
                content: const Text('开发基础组件'),
              ),
              YGTimelineItem(
                label: '2024-03-03',
                content: const Text('编写文档'),
              ),
              YGTimelineItem(
                label: '2024-03-04',
                content: const Text('发布第一个版本'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '交替展示',
          description: '内容在时间轴两侧交替出现。',
          demo: YGTimeline(
            mode: YGTimelineMode.alternate,
            items: [
              YGTimelineItem(
                label: '2024-03-01',
                content: YGCard(
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.all(16),
                    child: const Text('创建项目'),
                  ),
                ),
              ),
              YGTimelineItem(
                label: '2024-03-02',
                content: YGCard(
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.all(16),
                    child: const Text('开发基础组件'),
                  ),
                ),
              ),
              YGTimelineItem(
                label: '2024-03-03',
                content: YGCard(
                  child: Container(
                    width: 200,
                    padding: const EdgeInsets.all(16),
                    child: const Text('编写文档'),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义节点',
          description: '可以自定义时间轴节点的颜色和图标。',
          demo: YGTimeline(
            items: [
              YGTimelineItem(
                label: '2024-03-01',
                content: const Text('创建成功'),
                color: Colors.green,
                dot: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 16,
                ),
              ),
              YGTimelineItem(
                label: '2024-03-02',
                content: const Text('进行中...'),
                color: Colors.blue,
                dot: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 8,
                      height: 8,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              YGTimelineItem(
                label: '2024-03-03',
                content: const Text('等待中'),
                color: Colors.grey,
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
