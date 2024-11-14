import 'package:flutter/material.dart';

class YGDivider extends StatelessWidget {
  final double height;
  final double thickness;
  final Color? color;
  final String? text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  const YGDivider({
    Key? key,
    this.height = 1.0,
    this.thickness = 1.0,
    this.color,
    this.text,
    this.textStyle,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return Divider(
        height: height,
        thickness: thickness,
        color: color ?? Colors.grey[200],
      );
    }

    return Row(
      children: [
        Expanded(
          child: Divider(
            height: height,
            thickness: thickness,
            color: color ?? Colors.grey[200],
          ),
        ),
        if (text != null)
          Padding(
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              text!,
              style: textStyle ??
                  TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
            ),
          ),
        Expanded(
          child: Divider(
            height: height,
            thickness: thickness,
            color: color ?? Colors.grey[200],
          ),
        ),
      ],
    );
  }
}
