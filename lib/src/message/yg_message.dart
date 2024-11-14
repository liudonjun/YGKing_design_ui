import 'package:flutter/material.dart';

enum YGMessageType { info, success, warning, error }

class YGMessage extends StatelessWidget {
  final String content;
  final YGMessageType type;
  final Duration duration;
  final VoidCallback? onClose;
  final bool showClose;
  final Widget? icon;

  const YGMessage({
    Key? key,
    required this.content,
    this.type = YGMessageType.info,
    this.duration = const Duration(seconds: 3),
    this.onClose,
    this.showClose = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: icon!,
              )
            else
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _buildIcon(),
              ),
            Text(content),
            if (showClose) ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  onClose?.call();
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  size: 16,
                  color: Colors.black45,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    IconData iconData;
    Color color;

    switch (type) {
      case YGMessageType.success:
        iconData = Icons.check_circle;
        color = const Color(0xFF52C41A);
        break;
      case YGMessageType.warning:
        iconData = Icons.warning;
        color = const Color(0xFFFAAD14);
        break;
      case YGMessageType.error:
        iconData = Icons.error;
        color = const Color(0xFFFF4D4F);
        break;
      default:
        iconData = Icons.info;
        color = const Color(0xFF1890FF);
    }

    return Icon(iconData, color: color, size: 16);
  }

  static void show({
    required BuildContext context,
    required String content,
    YGMessageType type = YGMessageType.info,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onClose,
    bool showClose = false,
    Widget? icon,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 24,
        left: 0,
        right: 0,
        child: Center(
          child: YGMessage(
            content: content,
            type: type,
            duration: duration,
            onClose: onClose,
            showClose: showClose,
            icon: icon,
          ),
        ),
      ),
    );

    overlay.insert(entry);

    if (duration != Duration.zero) {
      Future.delayed(duration, () {
        entry.remove();
        onClose?.call();
      });
    }
  }
}
