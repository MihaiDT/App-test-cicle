import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void setStatusBarLight() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor:
          Colors.transparent, // Colore trasparente per la status bar
      statusBarIconBrightness:
          Brightness.light, // Icone scure per la status bar
    ),
  );
}

void setStatusBarDark() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor:
          Colors.transparent, // Colore trasparente per la status bar
      statusBarIconBrightness:
          Brightness.light, // Icone chiare per la status bar
    ),
  );
}
