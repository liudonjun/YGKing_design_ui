import 'package:flutter/material.dart';

enum YGProgressType { line, circle }

enum YGProgressStatus { normal, success, error }

class YGProgress extends StatelessWidget {
  final double percent;
  final YGProgressType type;
  final YGProgressStatus status;
  final Color? color;
  final double strokeWidth;
  final String Function(double)? format;
  final bool showInfo;
  final double? width;
  final double? size;

  const YGProgress({
    Key? key,
    required this.percent,
    this.type = YGProgressType.line,
    this.status = YGProgressStatus.normal,
    this.color,
    this.strokeWidth = 4.0,
    this.format,
    this.showInfo = true,
    this.width,
    this.size = 120.0,
  })  : assert(percent >= 0 && percent <= 100),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == YGProgressType.line
        ? _buildLineProgress()
        : _buildCircleProgress();
  }

  Widget _buildLineProgress() {
    return SizedBox(
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: strokeWidth,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Container(
                height: strokeWidth,
                width: (width ?? 100) * (percent / 100),
                decoration: BoxDecoration(
                  color: _getColor(),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
          if (showInfo) ...[
            const SizedBox(height: 8),
            Text(
              format?.call(percent) ?? '${percent.toStringAsFixed(1)}%',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCircleProgress() {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size!, size!),
            painter: _CircleProgressPainter(
              percent: percent,
              color: _getColor(),
              backgroundColor: Colors.grey[200]!,
              strokeWidth: strokeWidth,
            ),
          ),
          if (showInfo)
            Text(
              format?.call(percent) ?? '${percent.toStringAsFixed(1)}%',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: size! * 0.2,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }

  Color _getColor() {
    switch (status) {
      case YGProgressStatus.success:
        return const Color(0xFF52C41A);
      case YGProgressStatus.error:
        return const Color(0xFFFF4D4F);
      default:
        return color ?? const Color(0xFF1890FF);
    }
  }
}

class _CircleProgressPainter extends CustomPainter {
  final double percent;
  final Color color;
  final Color backgroundColor;
  final double strokeWidth;

  _CircleProgressPainter({
    required this.percent,
    required this.color,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // 绘制背景圆环
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    // 绘制进度圆环
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -90 * (3.1415926 / 180), // 从顶部开始
      (percent / 100) * 2 * 3.1415926, // 转换百分比为弧度
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CircleProgressPainter oldDelegate) {
    return oldDelegate.percent != percent ||
        oldDelegate.color != color ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
