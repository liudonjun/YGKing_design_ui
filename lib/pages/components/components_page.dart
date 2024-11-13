import 'package:flutter/material.dart';
import 'package:ygking_design_ui/src/buttons/yg_button_style.dart';
import '../../widgets/yg_nav_bar.dart';
import '../../src/buttons/yg_button.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const YGNavBar(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 左侧导航菜单
                SizedBox(
                  width: 240,
                  child: _buildSideMenu(),
                ),
                // 右侧内容区
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildButtonSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSideMenu() {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '通用',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          _buildMenuItem('按钮 Button', true),
          _buildMenuItem('图标 Icon', false),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '布局',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          _buildMenuItem('栅格 Grid', false),
          _buildMenuItem('间距 Space', false),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, bool isSelected) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: isSelected ? Colors.blue.withOpacity(0.1) : null,
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xFF1890FF) : Colors.black87,
        ),
      ),
    );
  }

  Widget _buildButtonSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '按钮 Button',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '按钮用于开始一个即时操作。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '按钮类型',
          description: 'YGking Design 为您提供了五种按钮类型',
          demo: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              YGButton(
                text: '主要按钮',
                onPressed: () {},
                style: YGButtonStyle.primary,
              ),
              YGButton(
                text: '次要按钮',
                onPressed: () {},
                style: YGButtonStyle.secondary,
              ),
              YGButton(
                text: '文本按钮',
                onPressed: () {},
                style: YGButtonStyle.text,
              ),
              YGButton(
                text: '危险按钮',
                onPressed: () {},
                style: YGButtonStyle.danger,
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
