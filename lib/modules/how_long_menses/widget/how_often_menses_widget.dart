import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/background_type.dart';

class HowOftenMensesWidget extends StatelessWidget {
  final BackgroundType backgroundType;
  final Function(int) onTap;
  late final ValueNotifier<int> howOftenMensesValue;

  HowOftenMensesWidget({
    super.key,
    this.backgroundType = BackgroundType.dark,
    required this.onTap,
  }) {
    howOftenMensesValue = ValueNotifier(_rangeMenses[18]);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await showCupertinoModalPopup<int>(
          context: context,
          builder: (BuildContext context) {
            return getCupertinoPicker(context);
          },
        ).then(
          (_) => onTap.call(howOftenMensesValue.value),
        );
      },
      child: Container(
        padding: ThemeSize.paddingS,
        decoration: BoxDecoration(
          border: Border.all(
            color: backgroundType == BackgroundType.dark
                ? Colors.white
                : ThemeColor.darkBlue,
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: 0,
              child: _fakeCounter,
            ),
            ValueListenableBuilder(
              valueListenable: howOftenMensesValue,
              builder: (BuildContext context, int value, Widget? child) {
                return HeadlineMedium(
                  "$value giorni",
                  color: backgroundType == BackgroundType.light
                      ? ThemeColor.darkBlue
                      : Colors.white,
                );
              },
            ),
            _fakeCounter,
          ],
        ),
      ),
    );
  }

  /// Text showed in the cupertino widget
  List<Widget> get _pickerChildren {
    return _rangeMenses
        .map(
          (rangeValue) => Center(
            child: HeadlineSmall(
              "$rangeValue giorni",
              color: Colors.black,
            ),
          ),
        )
        .toList();
  }

  /// Generate a list of int from 10 to 35 that are the range of the menses
  List<int> get _rangeMenses {
    int start = 10;
    int end = 35;
    return List<int>.generate(end - start + 1, (i) => i + start);
  }

  /// This is the showed widget, it's fake because is not tappable
  Widget get _fakeCounter {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 11,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          50,
        ),
        color: backgroundType == BackgroundType.dark
            ? Colors.white.withOpacity(0.3)
            : ThemeColor.darkBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 25,
        ),
        child: SvgPicture.asset(
          ThemeIcon.verticalArrows,
        ),
      ),
    );
  }

  /// Return cupertino picker
  Widget getCupertinoPicker(BuildContext context) {
    final daysController =
        FixedExtentScrollController(initialItem: 28 - _rangeMenses[0]);

    return Container(
      height: MediaQuery.sizeOf(context).height * 0.2,
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: Column(
        children: [
          ThemeSizedBox.height8,
          const HeadlineLarge(
            "Seleziona giorni",
            color: Colors.black,
          ),
          Expanded(
            child: CupertinoPicker(
              scrollController: daysController,
              itemExtent: 35,
              children: _pickerChildren,
              onSelectedItemChanged: (int value) {
                howOftenMensesValue.value = _rangeMenses[value];
              },
            ),
          ),
        ],
      ),
    );
  }
}
