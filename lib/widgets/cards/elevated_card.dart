import 'package:flutter/material.dart';

import '../../core/app_theme.dart';

class ElevatedCard extends StatelessWidget {
  final Widget child;
  final DecorationImage? backgroundImage;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final Border? border;
  final Function()? onPressed;

  const ElevatedCard({
    super.key,
    required this.child,
    this.backgroundImage,
    this.color,
    this.margin,
    this.border,
    this.onPressed,
  });

  const ElevatedCard.withBorder({
    super.key,
    required this.child,
    required this.border,
    this.backgroundImage,
    this.color,
    this.margin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: margin,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ThemeColor.shadowColor.withOpacity(0.2),
              offset: const Offset(10, 10),
              blurRadius: 21,
              spreadRadius: 4,
            ),
          ],
          border: border,
          image: backgroundImage,
        ),
        child: child,
      ),
    );
  }
}
