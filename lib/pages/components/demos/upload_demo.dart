import 'package:flutter/material.dart';
import '../../../src/upload/yg_upload.dart';
import '../../../src/buttons/yg_button.dart';

class UploadDemo extends StatelessWidget {
  const UploadDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '上传 Upload',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '文件选择上传和拖拽上传控件。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '点击上传',
          description: '经典款式，用户点击按钮弹出文件选择框。',
          demo: const YGUpload(
            label: '上传文件',
            hint: '支持扩展名：.jpg .jpeg .png',
            accept: ['.jpg', '.jpeg', '.png'],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '自定义上传按钮',
          description: '可以自定义上传按钮的样式。',
          demo: YGUpload(
            uploadButton: YGButton(
              text: '选择文件',
              icon: const Icon(Icons.add_photo_alternate, size: 16),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '拖拽上传',
          description: '把文件拖入指定区域，完成上传。',
          demo: const YGUpload(
            draggable: true,
            hint: '支持单个或批量上传',
            multiple: true,
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
