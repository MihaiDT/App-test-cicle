import "package:flutter/material.dart";
import "package:lines/core/app_theme.dart";

class LinkAccountWidget extends StatelessWidget {
  final String imagePath;
  final GestureTapCallback onTap;

  const LinkAccountWidget({
    required this.imagePath,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: ThemeColor.shadowColor.withOpacity(0.3),
            offset: const Offset(10, 10), // x and y offsets
            blurRadius: 21, // Blur radius
            spreadRadius: 4, // Spread radius
          ),
        ],
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          minRadius: 30,
          maxRadius: 30,
          child: Image.asset(
            imagePath,
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}
