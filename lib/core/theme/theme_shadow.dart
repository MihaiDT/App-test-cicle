import 'package:flutter/material.dart';

extension ThemeShadow on BoxShadow {
  static BoxShadow get buttonShadow => BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 0,
        blurRadius: 30,
        offset: const Offset(0, 20),
      );

  static BoxShadow get homeAvatarContainerShadow => BoxShadow(
        color: const Color(0xff9160D7).withOpacity(0.2),
        spreadRadius: 1,
        blurRadius: 20,
        offset: const Offset(0, 0),
      );
}
