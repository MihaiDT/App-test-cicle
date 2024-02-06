import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LightLoader extends StatelessWidget {
  const LightLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/light_loader.json');
  }
}
