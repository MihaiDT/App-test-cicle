import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class MissionProgressIndicator extends StatelessWidget {
  final int loadedProducts;

  const MissionProgressIndicator({
    super.key,
    required this.loadedProducts,
  });

  static const Color _inProgressBgColor = Color(0x1e2d4f33);
  static const int _totalCodes = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: _text,
    );
  }

  Widget get _text {
    if (loadedProducts == 0) {
      return const BodyMedium(
        "Inizia",
      );
    }
    if (loadedProducts == _totalCodes) {
      return BodyMedium("Richiedi premio $loadedProducts/$_totalCodes");
    }
    return BodyMedium("In corso $loadedProducts/$_totalCodes");
  }
}
