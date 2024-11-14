import 'package:flutter/material.dart';

enum YGMenuMode { vertical, horizontal }

class YGMenu extends StatefulWidget {
  final List<YGMenuItem> items;
  final YGMenuMode mode;
  final String? defaultSelectedKey;
  final ValueChanged<String>? onSelect;
  final Color? backgroundColor;
  final double? width;

  const YGMenu({
    Key? key,
    required this.items,
    this.mode = YGMenuMode.vertical,
    this.defaultSelectedKey,
    this.onSelect,
    this.backgroundColor,
    this.width,
  }) : super(key: key);

  @override
  State<YGMenu> createState() => _YGMenuState();
}

class _YGMenuState extends State<YGMenu> {
  late String? selectedKey;

  @override
  void initState() {
    super.initState();
    selectedKey = widget.defaultSelectedKey;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      color: widget.backgroundColor ?? Colors.white,
      child: widget.mode == YGMenuMode.vertical
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildMenuItems(),
            )
          : Row(
              children: _buildMenuItems(),
            ),
    );
  }

  List<Widget> _buildMenuItems() {
    return widget.items.map((item) {
      if (item is YGMenuSubItem) {
        return _buildSubMenu(item);
      }
      return _buildMenuItem(item);
    }).toList();
  }

  Widget _buildMenuItem(YGMenuItem item) {
    final bool isSelected = selectedKey == item.key;

    return InkWell(
      onTap: () {
        setState(() {
          selectedKey = item.key;
        });
        widget.onSelect?.call(item.key);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: isSelected ? const Color(0xFFE6F7FF) : null,
        child: Row(
          mainAxisSize: widget.mode == YGMenuMode.horizontal
              ? MainAxisSize.min
              : MainAxisSize.max,
          children: [
            if (item.icon != null) ...[
              Icon(
                item.icon,
                size: 16,
                color: isSelected ? const Color(0xFF1890FF) : Colors.black87,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              item.label,
              style: TextStyle(
                color: isSelected ? const Color(0xFF1890FF) : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubMenu(YGMenuSubItem item) {
    return ExpansionTile(
      leading: item.icon != null ? Icon(item.icon, size: 16) : null,
      title: Text(item.label),
      children: item.children.map((child) => _buildMenuItem(child)).toList(),
    );
  }
}

class YGMenuItem {
  final String key;
  final String label;
  final IconData? icon;

  const YGMenuItem({
    required this.key,
    required this.label,
    this.icon,
  });
}

class YGMenuSubItem extends YGMenuItem {
  final List<YGMenuItem> children;

  const YGMenuSubItem({
    required super.key,
    required super.label,
    super.icon,
    required this.children,
  });
}
