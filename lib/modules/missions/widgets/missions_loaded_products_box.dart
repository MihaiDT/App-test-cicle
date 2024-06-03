import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lines/data/models/product.dart';
import 'package:lines/modules/missions/widgets/missions_product.dart';

class MissionsLoadedProductsBox extends StatelessWidget {
  final Product? product;

  const MissionsLoadedProductsBox({
    this.product,
    super.key,
  });

  static const Color _bgColor = Color(0xffe5e1ef);
  double get _dimension => 90;
  static const double _strokeWidth = 3.0;

  @override
  Widget build(BuildContext context) {
    if (product != null) {
      return MissionsProduct(
        product: product!,
        dimension: _dimension,
        backGroundColor: _bgColor,
      );
    } else {
      return DottedBorder(
        color: _bgColor,
        dashPattern: const [6, 6],
        borderType: BorderType.RRect,
        strokeWidth: _strokeWidth,
        radius: const Radius.circular(10),
        child: SizedBox.square(
          dimension: _dimension,
        ),
      );
    }
  }
}
