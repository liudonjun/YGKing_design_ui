import 'package:flutter/material.dart';

class YGRate extends StatefulWidget {
  final double value;
  final ValueChanged<double>? onChange;
  final int count;
  final bool allowHalf;
  final bool disabled;
  final Color? activeColor;
  final Color? inactiveColor;
  final double size;
  final IconData? character;
  final String? tooltips;

  const YGRate({
    Key? key,
    required this.value,
    this.onChange,
    this.count = 5,
    this.allowHalf = false,
    this.disabled = false,
    this.activeColor,
    this.inactiveColor,
    this.size = 24,
    this.character,
    this.tooltips,
  })  : assert(value >= 0 && value <= count),
        super(key: key);

  @override
  State<YGRate> createState() => _YGRateState();
}

class _YGRateState extends State<YGRate> {
  double _hoverValue = 0;
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (_) {
        setState(() {
          _isHovering = false;
          _hoverValue = 0;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.count, (index) {
          final double starValue = index + 1.0;
          final bool isActive =
              (_isHovering ? _hoverValue : widget.value) >= starValue;
          final bool isHalfActive = widget.allowHalf &&
              (_isHovering ? _hoverValue : widget.value) >= starValue - 0.5 &&
              (_isHovering ? _hoverValue : widget.value) < starValue;

          return _buildStar(
            index,
            isActive,
            isHalfActive,
          );
        }),
      ),
    );
  }

  Widget _buildStar(int index, bool isActive, bool isHalfActive) {
    final Color activeColor = widget.activeColor ?? const Color(0xFFFAAD14);
    final Color inactiveColor = widget.inactiveColor ?? Colors.grey[300]!;

    return MouseRegion(
      onEnter: widget.disabled
          ? null
          : (_) {
              setState(() {
                _isHovering = true;
                _hoverValue = widget.allowHalf ? index + 0.5 : index + 1.0;
              });
            },
      onHover: widget.disabled
          ? null
          : (event) {
              if (widget.allowHalf) {
                final RenderBox box = context.findRenderObject() as RenderBox;
                final Offset localPosition = box.globalToLocal(event.position);
                final double dx = localPosition.dx - (index * widget.size);
                setState(() {
                  _hoverValue = index + (dx < widget.size / 2 ? 0.5 : 1.0);
                });
              }
            },
      child: GestureDetector(
        onTapDown: widget.disabled
            ? null
            : (details) {
                double newValue;
                if (widget.allowHalf) {
                  final RenderBox box = context.findRenderObject() as RenderBox;
                  final Offset localPosition =
                      box.globalToLocal(details.globalPosition);
                  final double dx = localPosition.dx - (index * widget.size);
                  newValue = index + (dx < widget.size / 2 ? 0.5 : 1.0);
                } else {
                  newValue = index + 1.0;
                }
                widget.onChange?.call(newValue);
              },
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            children: [
              Icon(
                widget.character ?? Icons.star,
                size: widget.size,
                color: inactiveColor,
              ),
              if (isActive || isHalfActive)
                ClipRect(
                  clipper: _StarClipper(
                    isHalf: isHalfActive,
                  ),
                  child: Icon(
                    widget.character ?? Icons.star,
                    size: widget.size,
                    color: activeColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final bool isHalf;

  _StarClipper({required this.isHalf});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      0,
      0,
      isHalf ? size.width / 2 : size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(_StarClipper oldClipper) {
    return oldClipper.isHalf != isHalf;
  }
}
