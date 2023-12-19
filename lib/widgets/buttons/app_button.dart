import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_button_size.dart';

import '../../core/app_theme.dart';
import '../texts/text_gradient.dart';

class PrimaryButton extends StatelessWidget {
  final ButtonSize buttonSize;
  final bool filled;
  final String text;
  final GestureTapCallback? onTap;
  final bool small;
  final bool fullWidth;

  const PrimaryButton({
    super.key,
    required this.filled,
    this.buttonSize = ButtonSize.h55,
    this.fullWidth = true,
    required this.text,
    this.small = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 20,
        shadowColor: Colors.black,
        minimumSize: Size(0, buttonSize.toDouble),
        textStyle: buttonSize.textStyle(
          Theme.of(context),
        ),
        padding: EdgeInsets.zero,
      ),
      child: Center(
        child: Ink(
          padding: buttonSize.buttonPadding,
          height: buttonSize.toDouble,
          decoration: onTap != null
              ? BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(small ? 20 : 61),
                  ),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFB63AB4),
                      Color(0xFF513B9F),
                    ],
                  ),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(small ? 20 : 60),
                  color: ThemeColor.buttonDisableBackGround,
                ),
          child: Center(
            child: TitleLarge(
              text,
            ),
          ),
        ),
      ),
    );
  }
}
