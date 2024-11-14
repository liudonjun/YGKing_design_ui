import 'package:flutter/material.dart';
import '../../../src/loading/yg_loading.dart';
import '../../../src/buttons/yg_button.dart';
import '../../../src/card/yg_card.dart';

class LoadingDemo extends StatefulWidget {
  const LoadingDemo({Key? key}) : super(key: key);

  @override
  State<LoadingDemo> createState() => _LoadingDemoState();
}

class _LoadingDemoState extends State<LoadingDemo> {
  bool loading1 = false;
  bool loading2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '加载中 Loading',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '用于页面和区块的加载中状态。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础用法',
          description: '最简单的加载中状态。',
          demo: Row(
            children: [
              YGButton(
                text: '显示加载',
                onPressed: () {
                  YGLoading.show(context, tip: '加载中...');
                  Future.delayed(const Duration(seconds: 2), () {
                    YGLoading.hide(context);
                  });
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '包裹内容',
          description: '可以直接把内容包裹在Loading组件中。',
          demo: Row(
            children: [
              YGButton(
                text: '切换加载状态',
                onPressed: () {
                  setState(() {
                    loading1 = !loading1;
                  });
                },
              ),
              const SizedBox(width: 24),
              SizedBox(
                width: 200,
                child: YGLoading(
                  loading: loading1,
                  tip: '加载中',
                  child: YGCard(
                    child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      child: const Text('卡片内容'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义样式',
          description: '可以自定义加载指示器的颜色和大小。',
          demo: Row(
            children: [
              YGLoading(
                loading: true,
                color: Colors.blue,
                size: 32,
                child: const SizedBox(),
              ),
              const SizedBox(width: 32),
              YGLoading(
                loading: true,
                color: Colors.red,
                size: 24,
                tip: '自定义颜色',
                child: const SizedBox(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '全屏加载',
          description: '全屏展示加载状态。',
          demo: Row(
            children: [
              YGButton(
                text: '切换全屏加载',
                onPressed: () {
                  setState(() {
                    loading2 = !loading2;
                  });
                },
              ),
              const SizedBox(width: 24),
              Expanded(
                child: YGLoading(
                  loading: loading2,
                  fullscreen: true,
                  tip: '正在处理...',
                  child: Container(
                    height: 200,
                    color: Colors.grey[100],
                    alignment: Alignment.center,
                    child: const Text('内容区域'),
                  ),
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
