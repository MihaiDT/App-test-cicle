import 'package:flutter/material.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_button_size.dart';

class SecondaryButton extends StatelessWidget {
  final ButtonSize buttonSize;
  final String text;
  final VoidCallback? onPressed;
  final bool? small;

  const SecondaryButton({
    this.buttonSize = ButtonSize.h56,
    required this.text,
    required this.onPressed,
    this.small,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, buttonSize.toDouble),
        textStyle: buttonSize.textStyle(
          Theme.of(context),
        ),
        padding: buttonSize.buttonPadding,
      ),
      child: Center(
        child: TitleLarge(
          text,
        ).applyShaders(context),
      ),
    );
  }
}
