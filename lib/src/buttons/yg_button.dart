import 'package:flutter/material.dart';
import 'yg_button_style.dart';
import '../../themes/yg_theme_colors.dart';

class YGButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final YGButtonStyle style;
  final bool disabled;
  final bool loading;
  final double? width;
  final double? height;
  final Widget? icon;

  const YGButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.style = YGButtonStyle.primary,
    this.disabled = false,
    this.loading = false,
    this.width,
    this.height,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttonChild = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (loading) ...[
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(width: 8),
        ],
        if (icon != null && !loading) ...[
          icon!,
          const SizedBox(width: 8),
        ],
        Text(text),
      ],
    );

    return SizedBox(
      width: width,
      height: height,
      child: style == YGButtonStyle.text
          ? TextButton(
              onPressed: disabled || loading ? null : onPressed,
              style: _getTextButtonStyle(),
              child: buttonChild,
            )
          : ElevatedButton(
              onPressed: disabled || loading ? null : onPressed,
              style: _getButtonStyle(),
              child: buttonChild,
            ),
    );
  }

  ButtonStyle _getButtonStyle() {
    switch (style) {
      case YGButtonStyle.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: YGThemeColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 0,
          disabledBackgroundColor: YGThemeColors.primary.withOpacity(0.4),
          disabledForegroundColor: Colors.white.withOpacity(0.8),
        );
      case YGButtonStyle.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF1890FF),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: Color(0xFF1890FF)),
          ),
          elevation: 0,
        );
      case YGButtonStyle.outline:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xFF1890FF),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: const BorderSide(color: Color(0xFF1890FF)),
          ),
          elevation: 0,
        );
      case YGButtonStyle.text:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xFF1890FF),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 0,
        );
      case YGButtonStyle.danger:
        return ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF4D4F),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 0,
        );
      default:
        return ElevatedButton.styleFrom(
          backgroundColor: YGThemeColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 0,
        );
    }
  }

  ButtonStyle _getTextButtonStyle() {
    return TextButton.styleFrom(
      foregroundColor: const Color(0xFF1890FF),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
