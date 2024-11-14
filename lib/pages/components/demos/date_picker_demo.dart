import 'package:flutter/material.dart';
import '../../../src/date_picker/yg_date_picker.dart';

class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({Key? key}) : super(key: key);

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime? selectedDate1;
  DateTime? selectedDate2;
  DateTime? selectedDate3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '日期选择器 DatePicker',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '输入或选择日期的控件。',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 48),
        _buildDemoCard(
          title: '基本使用',
          description: '最简单的用法。',
          demo: YGDatePicker(
            value: selectedDate1,
            onChanged: (date) {
              setState(() {
                selectedDate1 = date;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '日期格式',
          description: '使用不同的日期格式。',
          demo: YGDatePicker(
            value: selectedDate2,
            format: 'yyyy年MM月dd日',
            onChanged: (date) {
              setState(() {
                selectedDate2 = date;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
        _buildDemoCard(
          title: '禁用日期',
          description: '可以通过 minDate 和 maxDate 禁用日期。',
          demo: YGDatePicker(
            value: selectedDate3,
            minDate: DateTime.now(),
            maxDate: DateTime.now().add(const Duration(days: 30)),
            onChanged: (date) {
              setState(() {
                selectedDate3 = date;
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
