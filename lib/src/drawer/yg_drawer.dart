import 'package:flutter/material.dart';

class YGDrawer extends StatefulWidget {
  final Widget? title;
  final Widget content;
  final List<Widget>? actions;
  final bool showClose;
  final VoidCallback? onClose;
  final double width;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final YGDrawerPlacement placement;
  final bool mask;
  final Color? maskColor;

  const YGDrawer({
    Key? key,
    this.title,
    required this.content,
    this.actions,
    this.showClose = true,
    this.onClose,
    this.width = 378,
    this.padding = const EdgeInsets.all(24),
    this.backgroundColor,
    this.placement = YGDrawerPlacement.right,
    this.mask = true,
    this.maskColor,
  }) : super(key: key);

  @override
  State<YGDrawer> createState() => _YGDrawerState();
}

class _YGDrawerState extends State<YGDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleClose() {
    _controller.reverse().then((_) {
      if (widget.onClose != null) {
        widget.onClose!();
      }
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        _handleClose();
        return false;
      },
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          child: Stack(
            children: [
              // 遮罩层
              if (widget.mask)
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) => Opacity(
                    opacity: _animation.value * 0.5,
                    child: GestureDetector(
                      onTap: _handleClose,
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height,
                        color: widget.maskColor ?? Colors.black,
                      ),
                    ),
                  ),
                ),
              // 抽屉内容
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  final offset = (1 - _animation.value) *
                      (widget.placement == YGDrawerPlacement.left
                          ? -widget.width
                          : widget.width);
                  return Positioned(
                    left: widget.placement == YGDrawerPlacement.left
                        ? offset
                        : null,
                    right: widget.placement == YGDrawerPlacement.right
                        ? -offset
                        : null,
                    top: 0,
                    bottom: 0,
                    width: widget.width,
                    child: Material(
                      color: widget.backgroundColor ?? Colors.white,
                      elevation: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: widget.padding,
                              child: widget.content,
                            ),
                          ),
                          if (widget.actions != null) _buildFooter(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    if (widget.title == null && !widget.showClose) return const SizedBox();

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.title != null)
            Expanded(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                child: widget.title!,
              ),
            ),
          if (widget.showClose)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _handleClose,
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
        children: widget.actions!
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
}

enum YGDrawerPlacement {
  left,
  right,
}
