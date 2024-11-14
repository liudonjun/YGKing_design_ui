import 'package:flutter/material.dart';
import '../../../src/table/yg_table.dart';
import '../../../src/tag/yg_tag.dart';

class TableDemo extends StatelessWidget {
  const TableDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '表格 Table',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '展示行列数据。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础表格',
          description: '基础的表格展示用法。',
          demo: YGTable<Map<String, dynamic>>(
            columns: [
              const YGTableColumn(
                title: '姓名',
                field: 'name',
                width: 200,
              ),
              const YGTableColumn(
                title: '年龄',
                field: 'age',
                width: 100,
                align: TextAlign.center,
              ),
              YGTableColumn(
                title: '状态',
                field: 'status',
                width: 150,
                render: (record) => YGTag(
                  text: record['status'],
                  type: record['status'] == '在线'
                      ? YGTagType.success
                      : YGTagType.danger,
                ),
              ),
              const YGTableColumn(
                title: '地址',
                field: 'address',
                width: 300,
              ),
            ],
            dataSource: const [
              {
                'name': '张三',
                'age': 32,
                'status': '在线',
                'address': '浙江省杭州市西湖区',
              },
              {
                'name': '李四',
                'age': 42,
                'status': '离线',
                'address': '浙江省宁波市海曙区',
              },
              {
                'name': '王五',
                'age': 28,
                'status': '在线',
                'address': '浙江省温州市鹿城区',
              },
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '可交互表格',
          description: '添加表格行点击事件。',
          demo: YGTable<Map<String, dynamic>>(
            columns: const [
              YGTableColumn(
                title: '姓名',
                field: 'name',
                width: 200,
                sortable: true,
              ),
              YGTableColumn(
                title: '年龄',
                field: 'age',
                width: 100,
                align: TextAlign.center,
              ),
              YGTableColumn(
                title: '地址',
                field: 'address',
                width: 300,
              ),
            ],
            dataSource: const [
              {
                'name': '张三',
                'age': 32,
                'address': '浙江省杭州市西湖区',
              },
              {
                'name': '李四',
                'age': 42,
                'address': '浙江省宁波市海曙区',
              },
            ],
            striped: true,
            onRowTap: (record) {
              debugPrint('Clicked row: ${record['name']}');
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
