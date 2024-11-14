import 'package:flutter/material.dart';

enum YGAvatarSize { small, medium, large }

class YGAvatar extends StatelessWidget {
  final String? imageUrl;
  final Widget? icon;
  final String? text;
  final YGAvatarSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onTap;
  final BoxShape shape;

  const YGAvatar({
    Key? key,
    this.imageUrl,
    this.icon,
    this.text,
    this.size = YGAvatarSize.medium,
    this.backgroundColor,
    this.textColor,
    this.onTap,
    this.shape = BoxShape.circle,
  })  : assert(imageUrl != null || icon != null || text != null,
            'Either imageUrl, icon or text must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double dimension = _getSize();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: dimension,
        height: dimension,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey[200],
          shape: shape,
          image: imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: imageUrl == null
            ? Center(
                child: _buildContent(dimension),
              )
            : null,
      ),
    );
  }

  Widget _buildContent(double dimension) {
    if (icon != null) {
      return IconTheme(
        data: IconThemeData(
          color: textColor ?? Colors.white,
          size: dimension * 0.5,
        ),
        child: icon!,
      );
    }

    if (text != null) {
      return Text(
        text!.length > 2 ? text!.substring(0, 2) : text!,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: dimension * 0.4,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    return const SizedBox();
  }

  double _getSize() {
    switch (size) {
      case YGAvatarSize.small:
        return 32;
      case YGAvatarSize.medium:
        return 40;
      case YGAvatarSize.large:
        return 48;
    }
  }
}
