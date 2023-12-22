import 'package:flutter/material.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_button_size.dart';

import '../../core/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final ButtonSize buttonSize;
  final String text;
  final GestureTapCallback? onPressed;
  final bool small;
  final bool fullWidth;

  const PrimaryButton({
    super.key,
    this.buttonSize = ButtonSize.h56,
    this.fullWidth = true,
    required this.text,
    this.small = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        minimumSize: Size(double.infinity, buttonSize.toDouble),
        padding: EdgeInsets.zero,
      ),
      child: Ink(
        padding: buttonSize.buttonPadding,
        height: buttonSize.toDouble,
        width: double.infinity,
        decoration: onPressed != null
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
    );
  }
}
