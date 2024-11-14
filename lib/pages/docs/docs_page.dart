import 'package:flutter/material.dart';
import '../../widgets/yg_nav_bar.dart';
import '../../themes/yg_theme_colors.dart';

class DocsPage extends StatelessWidget {
  const DocsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;

    return Scaffold(
      body: Column(
        children: [
          const YGNavBar(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isMobile ? 16 : 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '开发文档',
                        style: TextStyle(
                          fontSize: isMobile ? 24 : 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: isMobile ? 16 : 24),
                      _buildSection(
                        title: '安装',
                        content: '''
在项目的 pubspec.yaml 文件中添加依赖：

```yaml
dependencies:
  ygking_design_ui: ^1.0.0
```

然后运行:

```bash
flutter pub get
```''',
                        isMobile: isMobile,
                      ),
                      SizedBox(height: isMobile ? 24 : 32),
                      _buildSection(
                        title: '使用',
                        content: '''
导入组件库：

```dart
import 'package:ygking_design_ui/ygking_design_ui.dart';
```

使用组件：

```dart
YGButton(
  text: '点击我',
  onPressed: () {
    print('按钮被点击了！');
  },
)
```''',
                        isMobile: isMobile,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required bool isMobile,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: isMobile ? 12 : 16),
        Container(
          padding: EdgeInsets.all(isMobile ? 16 : 24),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Text(
            content,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }
}
