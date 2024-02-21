import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/mission.dart';

class MissionContainer extends StatelessWidget {
  final Mission mission;

  const MissionContainer({
    required this.mission,
    super.key,
  });

  static const Color _borderColor = Color(0x4cf5f5f5);
  static const double _borderRadius = 20.0;
  static const double _externalContainerPadding = 4.0;
  static const Color _inProgressBgColor = Color(0x1e2d4f33);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        _externalContainerPadding,
      ),
      decoration: BoxDecoration(
        color: _borderColor,
        borderRadius: BorderRadius.circular(
          _borderRadius,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            _borderRadius - _externalContainerPadding,
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      image: mission.imageUrl?.isNotEmpty == true
                          ? DecorationImage(
                              image: NetworkImage(mission.imageUrl!),
                            )
                          : null,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          _borderRadius - _externalContainerPadding,
                        ),
                        topRight: Radius.circular(
                          _borderRadius - _externalContainerPadding,
                        ),
                      ),
                    ),
                    child:
                        mission.imageUrl == null ? const Placeholder() : null,
                  ),
                  // child: ClipRRect(
                  //   borderRadius: const BorderRadius.only(
                  //     topLeft: Radius.circular(
                  //       _borderRadius - _externalContainerPadding,
                  //     ),
                  //     topRight: Radius.circular(
                  //       _borderRadius - _externalContainerPadding,
                  //     ),
                  //   ),
                  //   child: mission.imageUrl?.isNotEmpty == true
                  //       ? Image.network(
                  //           mission.imageUrl!,
                  //           fit: BoxFit.cover,
                  //         )
                  //       : const Placeholder(),
                  // ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThemeSizedBox.height16,
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: TitleMedium(
                          "FINO AL ${mission.untilDate}",
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
                )
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(90),
                    ),
                    color: _inProgressBgColor,
                  ),
                  child: BodySmall(
                    "In corso: ${mission.currentCodes}/${mission.totalCodes}",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
