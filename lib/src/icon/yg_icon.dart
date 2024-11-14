import 'package:flutter/material.dart';

class YGIcon extends StatelessWidget {
  final IconData icon;
  final double? size;
  final Color? color;
  final bool spinning;
  final VoidCallback? onTap;

  const YGIcon({
    Key? key,
    required this.icon,
    this.size,
    this.color,
    this.spinning = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(
      icon,
      size: size,
      color: color,
    );

    if (spinning) {
      iconWidget = AnimatedRotation(
        duration: const Duration(seconds: 2),
        turns: 1,
        child: iconWidget,
      );
    }

    if (onTap != null) {
      iconWidget = MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: iconWidget,
        ),
      );
    }

    return iconWidget;
  }
}
