import 'package:flutter/material.dart';

enum YGTagType { primary, success, warning, danger }

class YGTag extends StatelessWidget {
  final String text;
  final YGTagType type;
  final bool closable;
  final VoidCallback? onClose;
  final bool bordered;
  final Color? color;
  final Color? backgroundColor;

  const YGTag({
    Key? key,
    required this.text,
    this.type = YGTagType.primary,
    this.closable = false,
    this.onClose,
    this.bordered = false,
    this.color,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = _getColors();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.backgroundColor,
        border: bordered
            ? Border.all(
                color: colors.borderColor,
                width: 1,
              )
            : null,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: color ?? colors.textColor,
              fontSize: 12,
            ),
          ),
          if (closable) ...[
            const SizedBox(width: 4),
            InkWell(
              onTap: onClose,
              child: Icon(
                Icons.close,
                size: 12,
                color: color ?? colors.textColor,
              ),
            ),
          ],
        ],
      ),
    );
  }

  _TagColors _getColors() {
    switch (type) {
      case YGTagType.primary:
        return _TagColors(
          backgroundColor: const Color(0xFFE6F7FF),
          textColor: const Color(0xFF1890FF),
          borderColor: const Color(0xFF91D5FF),
        );
      case YGTagType.success:
        return _TagColors(
          backgroundColor: const Color(0xFFF6FFED),
          textColor: const Color(0xFF52C41A),
          borderColor: const Color(0xFFB7EB8F),
        );
      case YGTagType.warning:
        return _TagColors(
          backgroundColor: const Color(0xFFFFF7E6),
          textColor: const Color(0xFFFA8C16),
          borderColor: const Color(0xFFFFD591),
        );
      case YGTagType.danger:
        return _TagColors(
          backgroundColor: const Color(0xFFFFF1F0),
          textColor: const Color(0xFFFF4D4F),
          borderColor: const Color(0xFFFFCCC7),
        );
    }
  }
}

class _TagColors {
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  _TagColors({
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
  });
}
