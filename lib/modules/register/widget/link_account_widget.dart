import "package:flutter/material.dart";

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
    return InkWell(
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
    );
  }
}
