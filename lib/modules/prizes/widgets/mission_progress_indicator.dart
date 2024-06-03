import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/blurred_filter.dart';

class MissionProgressIndicator extends StatelessWidget {
  final int loadedCodes;
  final int totalCodes;

  const MissionProgressIndicator({
    super.key,
    required this.loadedCodes,
    required this.totalCodes,
  });

  static final _inProgressBgColor = ThemeColor.darkBlue.withOpacity(0.2);
  static const _completedProgressBgColor = Color(0xff70B873);

  @override
  Widget build(BuildContext context) {
    return BlurredFilter(
      borderRadiusDegrees: 90,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(90),
          ),
          color: loadedCodes == totalCodes
              ? _completedProgressBgColor
              : _inProgressBgColor,
        ),
        child: _text,
      ),
    );
  }

  Widget get _text {
    if (loadedCodes == 0) {
      return const BodySmall(
        'Inizia',
        color: Colors.white,
      );
    }
    if (loadedCodes == totalCodes) {
      return const BodySmall(
        "Conclusa",
        color: Colors.white,
      );
    }
    return BodySmall(
      "In corso $loadedCodes/$totalCodes",
      color: Colors.white,
    );
  }
}
