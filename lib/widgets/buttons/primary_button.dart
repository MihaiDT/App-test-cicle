import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final ButtonSize buttonSize;
  final Widget child;
  final GestureTapCallback? onPressed;
  final bool small;

  const PrimaryButton({
    super.key,
    this.buttonSize = ButtonSize.h56,
    required this.child,
    this.small = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0x339160D7).withOpacity(0.2),
            offset: const Offset(10, 10),
            blurRadius: 21,
            spreadRadius: 4,
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(small ? 20 : 61),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          minimumSize: Size(0, buttonSize.toDouble),
          padding: EdgeInsets.zero,
        ),
        child: Ink(
          padding: buttonSize.buttonPadding,
          height: buttonSize.toDouble,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(small ? 20 : 61),
            ),
            gradient: onPressed != null
                ? const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFB63AB4),
                      Color(0xFF513B9F),
                    ],
                  )
                : null,
            color:
                onPressed == null ? ThemeColor.buttonDisableBackGround : null,
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
