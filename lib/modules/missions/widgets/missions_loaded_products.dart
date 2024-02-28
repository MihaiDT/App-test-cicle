import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/product.dart';
import 'package:lines/modules/missions/widgets/missions_loaded_products_box.dart';

class MissionsLoadedProducts extends StatelessWidget {
  final List<Product> products;

  const MissionsLoadedProducts({
    required this.products,
    super.key,
  });

  static const Color _bgColor = Color(0xfff3eef4);

  int get _productsNumber => products.length > 3 ? 3 : products.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      decoration: const BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ThemeSizedBox.height12,
          BodyMedium(
            "Prodotti caricati $_productsNumber su 3",
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.height8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MissionsLoadedProductsBox(
                product: products.isNotEmpty ? products[0] : null,
              ),
              ThemeSizedBox.width16,
              MissionsLoadedProductsBox(
                product: products.length > 1 ? products[1] : null,
              ),
              ThemeSizedBox.width16,
              MissionsLoadedProductsBox(
                product: products.length > 2 ? products[2] : null,
              ),
            ],
          ),
          ThemeSizedBox.height24,
        ],
      ),
    );
  }
}
