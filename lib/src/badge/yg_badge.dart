import 'package:flutter/material.dart';

class YGBadge extends StatelessWidget {
  final Widget child;
  final String? count;
  final bool dot;
  final Color? color;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  const YGBadge({
    Key? key,
    required this.child,
    this.count,
    this.dot = false,
    this.color,
    this.size,
    this.padding,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (dot || count != null)
          Positioned(
            top: -6,
            right: -6,
            child: _buildBadge(),
          ),
      ],
    );
  }

  Widget _buildBadge() {
    if (dot) {
      return Container(
        width: size ?? 8,
        height: size ?? 8,
        decoration: BoxDecoration(
          color: color ?? const Color(0xFFFF4D4F),
          shape: BoxShape.circle,
        ),
      );
    }

    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFFF4D4F),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        count ?? '',
        style: textStyle ??
            const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
