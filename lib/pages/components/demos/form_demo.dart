import 'package:flutter/material.dart';
import '../../../src/form/yg_form.dart';
import '../../../src/input/yg_input.dart';
import '../../../src/switch/yg_switch.dart';
import '../../../src/buttons/yg_button.dart';
import '../../../src/buttons/yg_button_style.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final GlobalKey<YGFormState> _formKey = GlobalKey<YGFormState>();
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '表单 Form',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '具有数据收集、校验和提交功能的表单。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基础表单',
          description: '基础的表单数据域控制展示。',
          demo: YGForm(
            key: _formKey,
            items: [
              YGFormItem(
                name: 'username',
                label: '用户名',
                required: true,
                field: const YGInput(
                  placeholder: '请输入用户名',
                ),
                validator: (value) {
                  if (value == null || value.toString().isEmpty) {
                    return '请输入用户名';
                  }
                  return null;
                },
              ),
              YGFormItem(
                name: 'email',
                label: '邮箱',
                field: const YGInput(
                  placeholder: '请输入邮箱',
                ),
              ),
              YGFormItem(
                name: 'active',
                label: '状态',
                field: YGSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '垂直布局',
          description: '垂直方向的表单布局。',
          demo: Column(
            children: [
              YGForm(
                layout: YGFormLayout.vertical,
                items: [
                  YGFormItem(
                    name: 'title',
                    label: '标题',
                    required: true,
                    field: const YGInput(
                      placeholder: '请输入标题',
                    ),
                  ),
                  YGFormItem(
                    name: 'description',
                    label: '描述',
                    field: const YGInput(
                      placeholder: '请输入描述',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  YGButton(
                    text: '取消',
                    style: YGButtonStyle.text,
                    onPressed: () {},
                  ),
                  const SizedBox(width: 8),
                  YGButton(
                    text: '提交',
                    onPressed: () {},
                  ),
                ],
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
