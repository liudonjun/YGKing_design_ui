import 'package:flutter/material.dart';

enum YGStepStatus { wait, process, finish, error }

class YGStepItem {
  final String title;
  final String? description;
  final Widget? icon;
  final YGStepStatus status;

  const YGStepItem({
    required this.title,
    this.description,
    this.icon,
    this.status = YGStepStatus.wait,
  });
}

class YGSteps extends StatelessWidget {
  final List<YGStepItem> steps;
  final int current;
  final bool vertical;
  final double? width;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? errorColor;

  const YGSteps({
    Key? key,
    required this.steps,
    this.current = 0,
    this.vertical = false,
    this.width,
    this.activeColor,
    this.inactiveColor,
    this.errorColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: vertical
          ? Column(
              children: _buildSteps(),
            )
          : Row(
              children: _buildSteps(),
            ),
    );
  }

  List<Widget> _buildSteps() {
    return steps.asMap().entries.map((entry) {
      final index = entry.key;
      final step = entry.value;
      final isLast = index == steps.length - 1;

      return Expanded(
        child: Row(
          crossAxisAlignment:
              vertical ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            _buildStep(step, index),
            if (!isLast) Expanded(child: _buildLine(index)),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildStep(YGStepItem step, int index) {
    final bool isActive = index == current;
    final bool isFinished = index < current;
    final bool isError = step.status == YGStepStatus.error;

    Color getColor() {
      if (isError) return errorColor ?? const Color(0xFFFF4D4F);
      if (isActive || isFinished) return activeColor ?? const Color(0xFF1890FF);
      return inactiveColor ?? Colors.grey;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isFinished ? getColor() : Colors.white,
                border: Border.all(
                  color: getColor(),
                  width: 2,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: step.icon ??
                    (isFinished
                        ? const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: getColor(),
                              fontWeight: FontWeight.bold,
                            ),
                          )),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  step.title,
                  style: TextStyle(
                    color: getColor(),
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                if (step.description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    step.description!,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLine(int index) {
    final bool isActive = index < current;
    return Container(
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: isActive
          ? (activeColor ?? const Color(0xFF1890FF))
          : (inactiveColor ?? Colors.grey[300]),
    );
  }
}
