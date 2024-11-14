import 'package:flutter/material.dart';
import '../../themes/yg_theme_colors.dart';

class YGCard extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final Widget? cover;
  final List<Widget>? actions;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final bool hoverable;
  final VoidCallback? onTap;
  final double elevation;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const YGCard({
    Key? key,
    this.title,
    this.subtitle,
    this.cover,
    this.actions,
    this.child,
    this.padding,
    this.hoverable = false,
    this.onTap,
    this.elevation = 1,
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cardChild = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (cover != null) cover!,
        if (title != null || subtitle != null)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    child: title!,
                  ),
                if (title != null && subtitle != null)
                  const SizedBox(height: 8),
                if (subtitle != null)
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    child: subtitle!,
                  ),
              ],
            ),
          ),
        if (child != null)
          Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child!,
          ),
        if (actions != null)
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey[200]!,
                ),
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: actions!
                  .map((action) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: action,
                      ))
                  .toList(),
            ),
          ),
      ],
    );

    return MouseRegion(
      cursor: onTap != null || hoverable
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: borderRadius ?? BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: YGThemeColors.primary.withOpacity(0.05),
                offset: const Offset(0, 1),
                blurRadius: elevation * 2,
                spreadRadius: 0,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.circular(4),
            child: cardChild,
          ),
        ),
      ),
    );
  }
}
