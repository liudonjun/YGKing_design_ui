import 'package:flutter/material.dart';

enum YGNotificationType { info, success, warning, error }

class YGNotification extends StatelessWidget {
  final String title;
  final String? description;
  final YGNotificationType type;
  final Duration duration;
  final VoidCallback? onClose;
  final bool showClose;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;

  const YGNotification({
    Key? key,
    required this.title,
    this.description,
    this.type = YGNotificationType.info,
    this.duration = const Duration(seconds: 4),
    this.onClose,
    this.showClose = true,
    this.icon,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 384,
        padding: padding ?? const EdgeInsets.all(16),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 12, top: 2),
                child: icon!,
              )
            else
              Padding(
                padding: const EdgeInsets.only(right: 12, top: 2),
                child: _buildIcon(),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      description!,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (showClose)
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
        ),
      ),
    );
  }

  Widget _buildIcon() {
    IconData iconData;
    Color color;

    switch (type) {
      case YGNotificationType.success:
        iconData = Icons.check_circle;
        color = const Color(0xFF52C41A);
        break;
      case YGNotificationType.warning:
        iconData = Icons.warning;
        color = const Color(0xFFFAAD14);
        break;
      case YGNotificationType.error:
        iconData = Icons.error;
        color = const Color(0xFFFF4D4F);
        break;
      default:
        iconData = Icons.info;
        color = const Color(0xFF1890FF);
    }

    return Icon(iconData, color: color, size: 20);
  }

  static void show({
    required BuildContext context,
    required String title,
    String? description,
    YGNotificationType type = YGNotificationType.info,
    Duration duration = const Duration(seconds: 4),
    VoidCallback? onClose,
    bool showClose = true,
    Widget? icon,
    EdgeInsetsGeometry? padding,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry entry;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        top: 24,
        right: 24,
        child: YGNotification(
          title: title,
          description: description,
          type: type,
          duration: duration,
          onClose: onClose,
          showClose: showClose,
          icon: icon,
          padding: padding,
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
