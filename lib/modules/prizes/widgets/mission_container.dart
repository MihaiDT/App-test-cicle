import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/mission.dart';
import 'package:lines/modules/prizes/widgets/mission_progress_indicator.dart';
import 'package:lines/widgets/cards/elevated_card.dart';

class MissionContainer extends StatelessWidget {
  final Mission mission;
  final Color? borderColor;
  final Gradient? gradientBorder;
  final VoidCallback? onTap;

  const MissionContainer({
    required this.mission,
    this.onTap,
    super.key,
  })  : borderColor = null,
        gradientBorder = null;

  const MissionContainer.withBorder({
    required this.mission,
    this.borderColor,
    this.gradientBorder,
    this.onTap,
    super.key,
  });

  static const double _borderRadius = 20.0;
  static const double _borderWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: gradientBorder != null || borderColor != null
          ? ElevatedCard.withBorder(
              gradientBorder: gradientBorder,
              borderColor: borderColor,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      _borderRadius - _borderWidth,
                    ),
                  ),
                ),
                child: _mainContent,
              ),
            )
          : ElevatedCard(
              child: Container(
                color: Colors.white,
                child: _mainContent,
              ),
            ),
    );
  }

  Widget get _mainContent => Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Image.network(
                  mission.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThemeSizedBox.height16,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: TitleMedium(
                        // TODO add until date
                        "FINO AL ",
                        color: ThemeColor.brightPink,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: HeadlineSmall(
                        mission.description,
                        color: ThemeColor.darkBlue,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    ThemeSizedBox.height16,
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: MissionProgressIndicator(
                loadedProducts: mission.totalCounter,
              ),
            ),
          ),
        ],
      );
}
