import 'package:flutter/material.dart';
import '../../themes/yg_theme_colors.dart';

class YGInput extends StatelessWidget {
  final String? value;
  final ValueChanged<String>? onChanged;
  final String? placeholder;
  final bool disabled;
  final bool readOnly;
  final Widget? prefix;
  final Widget? suffix;
  final String? errorText;
  final int? maxLines;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;

  const YGInput({
    Key? key,
    this.value,
    this.onChanged,
    this.placeholder,
    this.disabled = false,
    this.readOnly = false,
    this.prefix,
    this.suffix,
    this.errorText,
    this.maxLines = 1,
    this.keyboardType,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: value)
        ..selection = TextSelection.collapsed(offset: value?.length ?? 0),
      onChanged: onChanged,
      enabled: !disabled,
      readOnly: readOnly,
      maxLines: maxLines,
      keyboardType: keyboardType,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: placeholder,
        errorText: errorText,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Color(0xFFD9D9D9),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Color(0xFFD9D9D9),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: YGThemeColors.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Color(0xFFFF4D4F),
          ),
        ),
        filled: disabled,
        fillColor: disabled ? const Color(0xFFF5F5F5) : null,
      ),
    );
  }
}
