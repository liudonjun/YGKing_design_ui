import 'package:flutter/material.dart';
import '../../themes/yg_theme_colors.dart';

class YGSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final String? activeText;
  final String? inactiveText;
  final bool loading;
  final bool disabled;
  final double width;
  final double height;

  const YGSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.activeText,
    this.inactiveText,
    this.loading = false,
    this.disabled = false,
    this.width = 44.0,
    this.height = 22.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (disabled || loading) ? null : () => onChanged?.call(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width,
        height: height,
        padding: EdgeInsets.symmetric(horizontal: height * 0.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          color: value ? YGThemeColors.primary : Colors.grey[300],
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: height - 4,
                height: height - 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: loading
                    ? Padding(
                        padding: EdgeInsets.all(height * 0.15),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            value
                                ? (activeColor ?? const Color(0xFF1890FF))
                                : (inactiveColor ?? Colors.grey),
                          ),
                        ),
                      )
                    : null,
              ),
            ),
            if (value && activeText != null)
              Positioned(
                left: 4,
                child: _buildText(activeText!, true),
              ),
            if (!value && inactiveText != null)
              Positioned(
                right: 4,
                child: _buildText(inactiveText!, false),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String text, bool isActive) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: height * 0.45,
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (disabled) {
      return Colors.grey[300]!;
    }
    if (value) {
      return activeColor ?? const Color(0xFF1890FF);
    }
    return inactiveColor ?? Colors.grey;
  }
}
