import 'package:flutter/material.dart';
import '../../../src/tabs/yg_tabs.dart';
import '../../../src/card/yg_card.dart';

class TabsDemo extends StatefulWidget {
  const TabsDemo({Key? key}) : super(key: key);

  @override
  State<TabsDemo> createState() => _TabsDemoState();
}

class _TabsDemoState extends State<TabsDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '标签页 Tabs',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '选项卡切换组件。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础用法',
          description: '基础的、简洁的标签页。',
          demo: YGTabs(
            items: [
              YGTabItem(
                label: '标签一',
                content: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('标签一内容'),
                ),
              ),
              YGTabItem(
                label: '标签二',
                content: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('标签二内容'),
                ),
              ),
              YGTabItem(
                label: '标签三',
                content: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('标签三内容'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '带图标的标签页',
          description: '有图标的标签页。',
          demo: YGTabs(
            items: [
              YGTabItem(
                label: '首页',
                icon: Icons.home,
                content: YGCard(
                  child: Container(
                    height: 120,
                    alignment: Alignment.center,
                    child: const Text('首页内容'),
                  ),
                ),
              ),
              YGTabItem(
                label: '个人中心',
                icon: Icons.person,
                content: YGCard(
                  child: Container(
                    height: 120,
                    alignment: Alignment.center,
                    child: const Text('个人中心内容'),
                  ),
                ),
              ),
              YGTabItem(
                label: '设置',
                icon: Icons.settings,
                content: YGCard(
                  child: Container(
                    height: 120,
                    alignment: Alignment.center,
                    child: const Text('设置内容'),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '居中',
          description: '标签居中展示。',
          demo: YGTabs(
            centered: true,
            items: [
              YGTabItem(
                label: '选项一',
                content: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('选项一内容'),
                ),
              ),
              YGTabItem(
                label: '选项二',
                content: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('选项二内容'),
                ),
              ),
              YGTabItem(
                label: '选项三',
                disabled: true,
                content: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('选项三内容'),
                ),
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
