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
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 10),
            blurRadius: 30,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(
            Size(0, buttonSize.toDouble),
          ),
          textStyle: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              return buttonSize.textStyle(
                Theme.of(context),
              );
            },
          ),
          backgroundColor: WidgetStateProperty.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return Colors.white.withOpacity(0.6);
              }

              return Colors.white;
            },
          ),
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all(buttonSize.buttonPadding),
        ),
        child: child,
      ),
    );
  }
}
