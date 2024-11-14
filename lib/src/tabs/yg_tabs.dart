import 'package:flutter/material.dart';

class YGTabItem {
  final String label;
  final Widget content;
  final IconData? icon;
  final bool disabled;

  const YGTabItem({
    required this.label,
    required this.content,
    this.icon,
    this.disabled = false,
  });
}

class YGTabs extends StatefulWidget {
  final List<YGTabItem> items;
  final int defaultActiveKey;
  final ValueChanged<int>? onChange;
  final bool centered;
  final double? width;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? indicatorColor;
  final double indicatorHeight;
  final EdgeInsetsGeometry? padding;

  const YGTabs({
    Key? key,
    required this.items,
    this.defaultActiveKey = 0,
    this.onChange,
    this.centered = false,
    this.width,
    this.activeColor,
    this.inactiveColor,
    this.indicatorColor,
    this.indicatorHeight = 2.0,
    this.padding,
  }) : super(key: key);

  @override
  State<YGTabs> createState() => _YGTabsState();
}

class _YGTabsState extends State<YGTabs> {
  late int _activeKey;

  @override
  void initState() {
    super.initState();
    _activeKey = widget.defaultActiveKey;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: widget.width,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[200]!,
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: widget.centered
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: widget.items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final bool isActive = index == _activeKey;

              return _buildTab(item, index, isActive);
            }).toList(),
          ),
        ),
        Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: widget.items[_activeKey].content,
        ),
      ],
    );
  }

  Widget _buildTab(YGTabItem item, int index, bool isActive) {
    final Color activeColor = widget.activeColor ?? const Color(0xFF1890FF);
    final Color inactiveColor = widget.inactiveColor ?? Colors.grey;
    final Color indicatorColor = widget.indicatorColor ?? activeColor;

    return InkWell(
      onTap: item.disabled
          ? null
          : () {
              if (index != _activeKey) {
                setState(() {
                  _activeKey = index;
                });
                widget.onChange?.call(index);
              }
            },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? indicatorColor : Colors.transparent,
              width: widget.indicatorHeight,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.icon != null) ...[
              Icon(
                item.icon,
                size: 16,
                color: item.disabled
                    ? Colors.grey[400]
                    : (isActive ? activeColor : inactiveColor),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              item.label,
              style: TextStyle(
                color: item.disabled
                    ? Colors.grey[400]
                    : (isActive ? activeColor : inactiveColor),
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
