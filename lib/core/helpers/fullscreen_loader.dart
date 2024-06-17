import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

OverlayEntry showFullScreenLoader({
  Duration dismissAfter = const Duration(seconds: 6),
}) {
  final overlayEntry = OverlayEntry(
    builder: (_) {
      return Container(
        color: Colors.black.withOpacity(0.7),
        height: Get.height,
        width: Get.width,
        child: Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: LottieBuilder.asset(
              "assets/lottie/light_loader.json",
            ),
          ),
        ),
      );
    },
    maintainState: false,
    opaque: false,
  );

  Overlay.of(Get.context!).insert(overlayEntry);

  // Rimuove l'OverlayEntry dopo 5 secondi
  Timer(dismissAfter, () {
    overlayEntry.remove();
  });

  return overlayEntry;
}
