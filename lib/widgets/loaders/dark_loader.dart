import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DarkLoader extends StatelessWidget {
  const DarkLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset('assets/lottie/dark_loader.json');
  }
}
