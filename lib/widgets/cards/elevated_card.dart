import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lines/core/app_theme.dart';

class ElevatedCard extends StatelessWidget {
  final Widget child;
  final DecorationImage? backgroundImage;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final Gradient? gradientBorder;
  final Color? borderColor;
  final Function()? onPressed;

  const ElevatedCard({
    super.key,
    required this.child,
    this.backgroundImage,
    this.color = Colors.white,
    this.margin,
    this.onPressed,
  })  : borderColor = null,
        gradientBorder = null;

  const ElevatedCard.withBorder({
    super.key,
    required this.child,
    this.borderColor,
    this.gradientBorder,
    this.backgroundImage,
    this.color = Colors.white,
    this.margin,
    this.onPressed,
  }) : assert(
          gradientBorder != null && borderColor == null ||
              gradientBorder == null && borderColor != null,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ThemeColor.shadowColor.withOpacity(0.2),
              offset: const Offset(10, 10),
              blurRadius: 21,
              spreadRadius: 4,
            ),
          ],
          border: borderColor != null
              ? Border.all(
                  width: 4,
                  color: borderColor!,
                )
              : gradientBorder != null
                  ? GradientBoxBorder(
                      gradient: gradientBorder!,
                      width: 4,
                    )
                  : null,
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        ),
      ),
    );
  }
}
