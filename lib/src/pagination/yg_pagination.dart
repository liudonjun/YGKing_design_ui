import 'package:flutter/material.dart';
import '../buttons/yg_button.dart';
import '../input/yg_input.dart';

class YGPagination extends StatefulWidget {
  final int total;
  final int current;
  final int pageSize;
  final ValueChanged<int>? onChange;
  final bool showQuickJumper;
  final bool showSizeChanger;
  final bool showTotal;
  final bool simple;
  final bool disabled;

  const YGPagination({
    Key? key,
    required this.total,
    this.current = 1,
    this.pageSize = 10,
    this.onChange,
    this.showQuickJumper = false,
    this.showSizeChanger = false,
    this.showTotal = false,
    this.simple = false,
    this.disabled = false,
  }) : super(key: key);

  @override
  State<YGPagination> createState() => _YGPaginationState();
}

class _YGPaginationState extends State<YGPagination> {
  late int _current;
  late int _pageSize;
  final TextEditingController _jumpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _current = widget.current;
    _pageSize = widget.pageSize;
  }

  int get _totalPages => (widget.total / _pageSize).ceil();

  void _onPageChange(int page) {
    if (page != _current && page > 0 && page <= _totalPages) {
      setState(() {
        _current = page;
      });
      widget.onChange?.call(page);
    }
  }

  List<Widget> _buildPagers() {
    const int maxCount = 5;
    final List<Widget> pagers = [];
    int start = 1;
    int end = _totalPages;

    if (_totalPages > maxCount) {
      if (_current <= 3) {
        end = 5;
      } else if (_current >= _totalPages - 2) {
        start = _totalPages - 4;
      } else {
        start = _current - 2;
        end = _current + 2;
      }
    }

    if (start > 1) {
      pagers.add(_buildPageButton(1));
      if (start > 2) {
        pagers.add(_buildEllipsis());
      }
    }

    for (int i = start; i <= end; i++) {
      pagers.add(_buildPageButton(i));
    }

    if (end < _totalPages) {
      if (end < _totalPages - 1) {
        pagers.add(_buildEllipsis());
      }
      pagers.add(_buildPageButton(_totalPages));
    }

    return pagers;
  }

  Widget _buildPageButton(int page) {
    final bool isSelected = page == _current;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: widget.disabled ? null : () => _onPageChange(page),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1890FF) : Colors.transparent,
            border: Border.all(
              color: isSelected ? const Color(0xFF1890FF) : Colors.grey[300]!,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              page.toString(),
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEllipsis() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 32,
      height: 32,
      child: const Center(
        child: Text(
          '...',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.simple) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          YGButton(
            text: '上一页',
            onPressed: _current > 1 && !widget.disabled
                ? () => _onPageChange(_current - 1)
                : null,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$_current / $_totalPages',
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
          YGButton(
            text: '下一页',
            onPressed: _current < _totalPages && !widget.disabled
                ? () => _onPageChange(_current + 1)
                : null,
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showTotal)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              '共 ${widget.total} 条',
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        YGButton(
          text: '上一页',
          onPressed: _current > 1 && !widget.disabled
              ? () => _onPageChange(_current - 1)
              : null,
        ),
        ...(_buildPagers()),
        YGButton(
          text: '下一页',
          onPressed: _current < _totalPages && !widget.disabled
              ? () => _onPageChange(_current + 1)
              : null,
        ),
        if (widget.showQuickJumper) ...[
          const SizedBox(width: 16),
          SizedBox(
            width: 80,
            child: YGInput(
              value: _jumpController.text,
              onChanged: (value) {
                final page = int.tryParse(value);
                if (page != null) {
                  _onPageChange(page);
                }
              },
            ),
          ),
        ],
      ],
    );
  }

  @override
  void dispose() {
    _jumpController.dispose();
    super.dispose();
  }
}
