import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class SecondaryButton extends StatelessWidget {
  final ButtonSize buttonSize;
  final Widget child;
  final VoidCallback? onPressed;
  final bool? small;

  const SecondaryButton({
    this.buttonSize = ButtonSize.h56,
    required this.child,
    required this.onPressed,
    this.small,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          Size(0, buttonSize.toDouble),
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            return buttonSize.textStyle(
              Theme.of(context),
            );
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.white.withOpacity(0.6);
            }

            return Colors.white;
          },
        ),
        padding: MaterialStateProperty.all(buttonSize.buttonPadding),
      ),
      child: child,
    );
  }
}
