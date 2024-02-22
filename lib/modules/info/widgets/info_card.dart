import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String description;
  final String? imagePath;

  const InfoCard({
    required this.title,
    required this.description,
    this.imagePath,
    super.key,
  });

  static const Color _containerColor = Color(0xfff3eef4);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      decoration: const BoxDecoration(
        color: _containerColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadlineMedium(
                  title,
                  color: ThemeColor.darkBlue,
                ),
                BodySmall(
                  description,
                  color: ThemeColor.darkBlue,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          imagePath?.isNotEmpty == true
              ? Image.asset(
                  imagePath!,
                  height: 120,
                )
              : const SizedBox(
                  height: 120,
                  child: Placeholder(),
                )
        ],
      ),
    );
  }
}
