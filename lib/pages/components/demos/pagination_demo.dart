import 'package:flutter/material.dart';
import '../../../src/pagination/yg_pagination.dart';

class PaginationDemo extends StatefulWidget {
  const PaginationDemo({Key? key}) : super(key: key);

  @override
  State<PaginationDemo> createState() => _PaginationDemoState();
}

class _PaginationDemoState extends State<PaginationDemo> {
  int currentPage1 = 1;
  int currentPage2 = 1;
  int currentPage3 = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '分页 Pagination',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '采用分页的形式分隔长列表。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础分页',
          description: '基础的分页。',
          demo: YGPagination(
            total: 50,
            current: currentPage1,
            onChange: (page) {
              setState(() {
                currentPage1 = page;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '更多功能',
          description: '支持跳转和显示总数。',
          demo: YGPagination(
            total: 100,
            current: currentPage2,
            showQuickJumper: true,
            showTotal: true,
            onChange: (page) {
              setState(() {
                currentPage2 = page;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '简单模式',
          description: '简单的翻页。',
          demo: YGPagination(
            total: 50,
            current: currentPage3,
            simple: true,
            onChange: (page) {
              setState(() {
                currentPage3 = page;
              });
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
