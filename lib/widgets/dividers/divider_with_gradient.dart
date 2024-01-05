import 'package:flutter/material.dart';

class DividerWithGradient extends StatelessWidget {
  final Gradient gradient;
  const DividerWithGradient({
    required this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(gradient: gradient),
    );
  }
}
