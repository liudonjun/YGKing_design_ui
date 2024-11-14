import 'package:flutter/material.dart';
import '../buttons/yg_button.dart';
import '../buttons/yg_button_style.dart';

class YGDialog extends StatelessWidget {
  final String? title;
  final Widget content;
  final List<Widget>? actions;
  final bool showClose;
  final VoidCallback? onClose;
  final double width;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const YGDialog({
    Key? key,
    this.title,
    required this.content,
    this.actions,
    this.showClose = true,
    this.onClose,
    this.width = 520,
    this.padding = const EdgeInsets.all(24),
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Padding(
              padding: padding,
              child: content,
            ),
            if (actions != null) _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    if (title == null && !showClose) return const SizedBox();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
      ),
      child: Row(
        children: [
          if (title != null)
            Expanded(
              child: Text(
                title!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (showClose)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                if (onClose != null) {
                  onClose!();
                } else {
                  Navigator.of(context).pop();
                }
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey[200]!,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: actions!
            .map(
              (action) => Padding(
                padding: const EdgeInsets.only(left: 8),
                child: action,
              ),
            )
            .toList(),
      ),
    );
  }

  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    required Widget content,
    List<Widget>? actions,
    bool showClose = true,
    VoidCallback? onClose,
    double width = 520,
    EdgeInsetsGeometry padding = const EdgeInsets.all(24),
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => YGDialog(
        title: title,
        content: content,
        actions: actions,
        showClose: showClose,
        onClose: onClose,
        width: width,
        padding: padding,
        backgroundColor: backgroundColor,
        borderRadius: borderRadius,
      ),
    );
  }

  static Future<bool?> confirm({
    required BuildContext context,
    String? title,
    required String content,
    String okText = '确定',
    String cancelText = '取消',
    VoidCallback? onOk,
    VoidCallback? onCancel,
  }) {
    return show<bool>(
      context: context,
      title: title,
      content: Text(content),
      actions: [
        YGButton(
          text: cancelText,
          style: YGButtonStyle.text,
          onPressed: () {
            Navigator.of(context).pop(false);
            onCancel?.call();
          },
        ),
        YGButton(
          text: okText,
          onPressed: () {
            Navigator.of(context).pop(true);
            onOk?.call();
          },
        ),
      ],
    );
  }
}
