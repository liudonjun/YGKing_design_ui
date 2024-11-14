import 'package:flutter/material.dart';
import 'package:ygking_design_ui/src/buttons/yg_button.dart';
import 'package:ygking_design_ui/src/buttons/yg_button_style.dart';
import '../../widgets/yg_nav_bar.dart';
import '../../src/input/yg_input.dart';
import '../../themes/yg_theme_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const YGNavBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(context),
                  _buildFeatures(context),
                  // _buildComponentShowcase(context),
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      height: isMobile ? 400 : 500,
      color: YGThemeColors.primary,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'YGking Design UI',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                '一个现代化的Flutter UI组件库',
                style: TextStyle(
                  fontSize: isMobile ? 18 : 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/components');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: YGThemeColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 32,
                    vertical: isMobile ? 12 : 16,
                  ),
                ),
                child: const Text('开始使用'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatures(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 32 : 64,
        horizontal: isMobile ? 16 : 32,
      ),
      child: Column(
        children: [
          Text(
            '特性',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: isMobile ? 24 : 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildFeatureCard(
                icon: Icons.speed,
                title: '高性能',
                description: '经过优化的组件确保流畅的用户体验',
                isMobile: isMobile,
              ),
              _buildFeatureCard(
                icon: Icons.brush,
                title: '可定制',
                description: '灵活的主题系统，轻松适应不同品牌',
                isMobile: isMobile,
              ),
              _buildFeatureCard(
                icon: Icons.devices,
                title: '响应式',
                description: '完美适配各种屏幕尺寸',
                isMobile: isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isMobile,
  }) {
    return SizedBox(
      width: isMobile ? double.infinity : 300,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16 : 24),
          child: Column(
            children: [
              Icon(icon,
                  size: isMobile ? 36 : 48, color: YGThemeColors.primary),
              const SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  fontSize: isMobile ? 20 : 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildComponentShowcase(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 32 : 64,
        horizontal: isMobile ? 16 : 32,
      ),
      color: Colors.grey[100],
      child: Column(
        children: [
          Text(
            '组件展示',
            style: TextStyle(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: isMobile ? 24 : 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildShowcaseCard(
                title: '按钮',
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    YGButton(
                      text: '主要按钮',
                      onPressed: () {},
                    ),
                    YGButton(
                      text: '次要按钮',
                      onPressed: () {},
                      style: YGButtonStyle.secondary,
                    ),
                  ],
                ),
                isMobile: isMobile,
              ),
              _buildShowcaseCard(
                title: '输入框',
                child: Column(
                  children: const [
                    YGInput(
                      placeholder: '请输入内容',
                    ),
                    SizedBox(height: 16),
                    YGInput(
                      placeholder: '禁用状态',
                      disabled: true,
                    ),
                  ],
                ),
                isMobile: isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildShowcaseCard({
    required String title,
    required Widget child,
    required bool isMobile,
  }) {
    return Card(
      elevation: 2,
      child: Container(
        width: isMobile ? double.infinity : 400,
        padding: EdgeInsets.all(isMobile ? 16 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(32),
      color: Colors.grey[900],
      child: const Center(
        child: Text(
          '© 2024 YGking Design UI. All rights reserved.',
          style: TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
