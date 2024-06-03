import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/product.dart';
import 'package:lines/modules/info/widgets/info_bottom_sheet.dart';
import 'package:lines/modules/info/widgets/info_where_to_find_the_code_bottomsheet..dart';
import 'package:lines/modules/missions/widgets/missions_loaded_products_box.dart';

class MissionsLoadedProducts extends StatelessWidget {
  final List<Product> products;
  final int totalCodes;
  final bool showBottomLink;
  final String? text;

  const MissionsLoadedProducts({
    this.text,
    required this.products,
    required this.totalCodes,
    this.showBottomLink = false,
    super.key,
  });

  static const Color _bgColor = Color(0xfff3eef4);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ThemeSizedBox.height16,
          BodyMedium(
            text ?? "Prodotti caricati ${products.length} su $totalCodes",
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.height12,
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                loadedProducts.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: loadedProducts[index],
                ),
              ),
            ),
          ),
          if (showBottomLink) ...[
            ThemeSizedBox.height8,
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  constraints: BoxConstraints(maxHeight: Get.height * 0.85),
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => const InfoBottomSheet(
                    child: InfoWhereToFindTheCodeBottomSheet(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: const TitleSmall(
                  "DOVE TROVO IL CODICE?",
                  underline: true,
                  fontWeight: FontWeight.w700,
                ).applyShaders(context),
              ),
            ),
          ],
          ThemeSizedBox.height16,
        ],
      ),
    );
  }

  List<Widget> get loadedProducts {
    List<Widget> widgets = [];

    for (int i = 0; i < totalCodes; i++) {
      if (i < products.length) {
        widgets.add(
          MissionsLoadedProductsBox(product: products[i]),
        );
      } else {
        widgets.add(
          const MissionsLoadedProductsBox(product: null),
        );
      }
    }

    return widgets;
  }
}
