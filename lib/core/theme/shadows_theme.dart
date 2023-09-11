import 'package:flutter/material.dart';

class ShadowsTheme {
  BoxShadow get button => BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 0,
        blurRadius: 30,
        offset: const Offset(0, 20),
      );
}
