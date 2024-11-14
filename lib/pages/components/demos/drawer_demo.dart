import 'package:flutter/material.dart';
import '../../../src/drawer/yg_drawer.dart';
import '../../../src/buttons/yg_button.dart';
import '../../../src/input/yg_input.dart';

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({Key? key}) : super(key: key);

  void _showDrawer(
    BuildContext context, {
    Widget? title,
    required Widget content,
    List<Widget>? actions,
    YGDrawerPlacement placement = YGDrawerPlacement.right,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) => YGDrawer(
        title: title,
        content: content,
        actions: actions,
        placement: placement,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '抽屉 Drawer',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '屏幕边缘滑出的浮层面板。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础抽屉',
          description: '基础抽屉，点击触发按钮抽屉从右滑出，点击遮罩层关闭。',
          demo: YGButton(
            text: '打开抽屉',
            onPressed: () {
              _showDrawer(
                context,
                title: const Text('基础抽屉'),
                content: const Text('这是抽屉内容区域'),
              );
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义位置',
          description: '自定义抽屉弹出位置。',
          demo: Row(
            children: [
              YGButton(
                text: '左侧打开',
                onPressed: () {
                  _showDrawer(
                    context,
                    title: const Text('左侧抽屉'),
                    content: const Text('这是抽屉内容区域'),
                    placement: YGDrawerPlacement.left,
                  );
                },
              ),
              const SizedBox(width: 16),
              YGButton(
                text: '右侧打开',
                onPressed: () {
                  _showDrawer(
                    context,
                    title: const Text('右侧抽屉'),
                    content: const Text('这是抽屉内容区域'),
                    placement: YGDrawerPlacement.right,
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '表单抽屉',
          description: '在抽屉中使用表单。',
          demo: YGButton(
            text: '打开表单抽屉',
            onPressed: () {
              _showDrawer(
                context,
                title: const Text('用户信息'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    YGInput(
                      placeholder: '请输入用户名',
                    ),
                    SizedBox(height: 16),
                    YGInput(
                      placeholder: '请输入邮箱',
                    ),
                  ],
                ),
                actions: [
                  YGButton(
                    text: '取消',
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  YGButton(
                    text: '提交',
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
