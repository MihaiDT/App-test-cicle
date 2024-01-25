import "package:flutter/material.dart";

class LinkAccountWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  const LinkAccountWidget({
    required this.imagePath,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      minRadius: 30,
      maxRadius: 30,
      child: Image.asset(
        imagePath,
        height: 24,
        width: 24,
      ),
    );
  }
}
