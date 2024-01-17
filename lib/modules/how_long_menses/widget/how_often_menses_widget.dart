import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';

class HowOftenMensesWidget extends StatelessWidget {
  final Function(int) onTap;
  late final ValueNotifier<int> howOftenMensesValue;

  HowOftenMensesWidget({
    super.key,
    required this.onTap,
  }) {
    howOftenMensesValue = ValueNotifier(_rangeMenses[0]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
            color: Colors.white,
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
          (rangeValue) => HeadlineSmall(
            "$rangeValue giorni",
            color: Colors.black,
          ),
        )
        .toList();
  }

  List<int> get _rangeMenses => [
        26,
        27,
        28,
        29,
        30,
        31,
        32,
      ];

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
        color: Colors.white.withOpacity(0.3),
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
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.2,
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: SafeArea(
        child: CupertinoPicker(
          itemExtent: 35,
          children: _pickerChildren,
          onSelectedItemChanged: (int value) {
            howOftenMensesValue.value = _rangeMenses[value];
          },
        ),
      ),
    );
  }
}
