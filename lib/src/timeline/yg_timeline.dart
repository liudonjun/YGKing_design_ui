import 'package:flutter/material.dart';

enum YGTimelineMode { left, right, alternate }

class YGTimelineItem {
  final String? label;
  final Widget content;
  final Widget? dot;
  final Color? color;

  const YGTimelineItem({
    this.label,
    required this.content,
    this.dot,
    this.color,
  });
}

class YGTimeline extends StatelessWidget {
  final List<YGTimelineItem> items;
  final YGTimelineMode mode;
  final bool pending;
  final Widget? pendingDot;

  const YGTimeline({
    Key? key,
    required this.items,
    this.mode = YGTimelineMode.left,
    this.pending = false,
    this.pendingDot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isLast = index == items.length - 1;

          return _buildTimelineItem(
            item,
            isLast,
            index,
          );
        }).toList(),
        if (pending)
          _buildTimelineItem(
            YGTimelineItem(
              content: const SizedBox(),
              dot: pendingDot ??
                  const SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
            ),
            true,
            items.length,
          ),
      ],
    );
  }

  Widget _buildTimelineItem(YGTimelineItem item, bool isLast, int index) {
    final bool isLeft = mode == YGTimelineMode.left ||
        (mode == YGTimelineMode.alternate && index.isEven);

    final Widget timelineItem = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isLeft) Expanded(child: _buildContent(item, true)),
          _buildDot(item, isLast),
          if (isLeft) Expanded(child: _buildContent(item, false)),
        ],
      ),
    );

    if (mode == YGTimelineMode.right) {
      return Row(
        children: [
          Expanded(child: timelineItem),
          const SizedBox(width: 40),
        ],
      );
    } else if (mode == YGTimelineMode.left) {
      return Row(
        children: [
          const SizedBox(width: 40),
          Expanded(child: timelineItem),
        ],
      );
    }

    return timelineItem;
  }

  Widget _buildDot(YGTimelineItem item, bool isLast) {
    return Container(
      width: 24,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          item.dot ??
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: item.color ?? const Color(0xFF1890FF),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
          if (!isLast)
            Expanded(
              child: Container(
                width: 2,
                color: Colors.grey[300],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent(YGTimelineItem item, bool isRight) {
    return Container(
      padding: EdgeInsets.only(
        left: isRight ? 0 : 8,
        right: isRight ? 8 : 0,
        bottom: 32,
      ),
      child: Column(
        crossAxisAlignment:
            isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (item.label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                item.label!,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
          item.content,
        ],
      ),
    );
  }
}
