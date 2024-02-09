import 'package:flutter/material.dart';

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
              color: Colors.black.withOpacity(0.02),
              offset: const Offset(0, -4),
              blurRadius: 12,
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              offset: const Offset(0, 4),
              blurRadius: 12,
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
