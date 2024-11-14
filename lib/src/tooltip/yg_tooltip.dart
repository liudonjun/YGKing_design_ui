import 'package:flutter/material.dart';

class YGTooltip extends StatelessWidget {
  final Widget child;
  final String message;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final Duration? showDuration;
  final TooltipTriggerMode? triggerMode;

  const YGTooltip({
    Key? key,
    required this.child,
    required this.message,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.padding,
    this.showDuration,
    this.triggerMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      textStyle: TextStyle(
        color: textColor ?? Colors.white,
        fontSize: fontSize ?? 14,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.circular(4),
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      showDuration: showDuration ?? const Duration(seconds: 2),
      triggerMode: triggerMode ?? TooltipTriggerMode.longPress,
      child: child,
    );
  }
}
