import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/charts/glowing_linear_progress_indicator.dart';

class BadgeTile extends StatelessWidget {
  final String? imagePath;
  final Color backgroundColor;
  final String title;
  final String description;
  final double? progressPercentage;
  final String? progressLabel;

  const BadgeTile({
    this.imagePath,
    this.backgroundColor = Colors.white,
    required this.description,
    required this.title,
    this.progressPercentage,
    this.progressLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constrains) {
            return Row(
              children: [
                SizedBox.square(
                  dimension: constrains.maxWidth * 0.2,
                  child: Image.network(
                    imagePath ?? "",
                    errorBuilder: (_, __, ___) {
                      return const Placeholder(
                        fallbackWidth: 100,
                        fallbackHeight: 100,
                      );
                    },
                  ),
                ),
                ThemeSizedBox.width16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HeadlineMedium(
                        title,
                        color: ThemeColor.darkBlue,
                        textAlign: TextAlign.start,
                      ),
                      BodyMedium(
                        description,
                        color: ThemeColor.darkBlue,
                        textAlign: TextAlign.start,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: constrains.maxWidth * 0.6,
                            child: GlowingLinearProgressIndicator(
                              value: progressPercentage ?? 0,
                            ),
                          ),
                          ThemeSizedBox.width8,
                          if (progressLabel?.isNotEmpty == true)
                            TitleSmall(
                              progressLabel!,
                              // #1F2D4F80
                              color: ThemeColor.darkBlue.withOpacity(0.5),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
