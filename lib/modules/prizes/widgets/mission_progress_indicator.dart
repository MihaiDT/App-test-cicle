import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/home/widgets/circular_period/circular_calendar.dart';

class MissionProgressIndicator extends StatelessWidget {
  final int loadedProducts;
  final bool _soon;
  final bool _completed;

  const MissionProgressIndicator({
    super.key,
    required this.loadedProducts,
  })  : _soon = false,
        _completed = false;

  const MissionProgressIndicator.soon({
    super.key,
  })  : loadedProducts = 0,
        _soon = true,
        _completed = false;

  const MissionProgressIndicator.completed({
    super.key,
  })  : loadedProducts = 3,
        _soon = false,
        _completed = true;

  static const Color _inProgressBgColor = Color(0x1e2d4f33);
  static const int _totalCodes = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(90),
        ),
        color:
            _completed ? CircularCalendar.follicolareColor : _inProgressBgColor,
      ),
      child: _text,
    );
  }

  Widget get _text {
    if (_soon) {
      return const BodyMedium(
        "Prossimamente",
      );
    }
    if (_completed) {
      return const BodyMedium(
        "Completata",
      );
    }
    if (loadedProducts == 0) {
      return BodyMedium("Inizia $loadedProducts/$_totalCodes");
    }
    if (loadedProducts == _totalCodes) {
      return BodyMedium("Richiedi premio $loadedProducts/$_totalCodes");
    }
    return BodyMedium("In corso $loadedProducts/$_totalCodes");
  }
}
