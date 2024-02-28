import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/product.dart';

class MissionsProduct extends StatelessWidget {
  final Product product;
  final double dimension;
  final Color? backGroundColor;
  final Border? border;

  const MissionsProduct({
    required this.product,
    required this.dimension,
    this.backGroundColor,
    this.border,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimension,
      width: dimension,
      decoration: BoxDecoration(
        border: border,
        color: backGroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Visibility.maintain(
            visible: product.isNight,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: ThemeColor.primary,
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              child: LabelLarge(
                "NOTTE",
                color: backGroundColor,
              ),
            ),
          ),
          SizedBox.square(
            dimension: dimension / 2.0,
            child: product.imageUrl != null
                ? Image.network(
                    product.imageUrl!,
                    fit: BoxFit.cover,
                  )
                : const Placeholder(),
          ),
          LabelMedium(
            product.name,
            color: ThemeColor.darkBlue,
          ),
        ],
      ),
    );
  }
}
