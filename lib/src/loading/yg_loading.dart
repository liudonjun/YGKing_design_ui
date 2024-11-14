import 'package:flutter/material.dart';

class YGLoading extends StatelessWidget {
  final bool loading;
  final Widget child;
  final String? tip;
  final Color? color;
  final double size;
  final bool fullscreen;
  final Color? backgroundColor;
  final Widget? indicator;

  const YGLoading({
    Key? key,
    required this.loading,
    required this.child,
    this.tip,
    this.color,
    this.size = 24.0,
    this.fullscreen = false,
    this.backgroundColor,
    this.indicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!loading) return child;

    Widget loadingWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        indicator ??
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                strokeWidth: size / 8,
                valueColor: AlwaysStoppedAnimation<Color>(
                  color ?? Theme.of(context).primaryColor,
                ),
              ),
            ),
        if (tip != null) ...[
          const SizedBox(height: 12),
          Text(
            tip!,
            style: TextStyle(
              color: color ?? Theme.of(context).primaryColor,
            ),
          ),
        ],
      ],
    );

    if (fullscreen) {
      return Stack(
        children: [
          child,
          Positioned.fill(
            child: Container(
              color: backgroundColor ?? Colors.white.withOpacity(0.9),
              child: Center(child: loadingWidget),
            ),
          ),
        ],
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        loadingWidget,
      ],
    );
  }

  static void show(BuildContext context, {String? tip, Widget? indicator}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black12,
      builder: (context) => Center(
        child: YGLoading(
          loading: true,
          tip: tip,
          indicator: indicator,
          child: const SizedBox(),
        ),
      ),
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Widget spinner({
    Color? color,
    double size = 24.0,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: size / 8,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? const Color(0xFF1890FF),
        ),
      ),
    );
  }
}
