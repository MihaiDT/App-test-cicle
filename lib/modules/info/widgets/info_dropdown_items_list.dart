import 'package:flutter/material.dart';
import 'package:lines/data/models/product.dart';
import 'package:lines/modules/info/widgets/info_dropdown_item.dart';

class InfoDropDownProductsList extends StatelessWidget {
  final List<Product> products;

  const InfoDropDownProductsList({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) => InfoDropDownItem(
        text: products[index].name,
        coinAmount: products[index].points,
      ),
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 4,
        ),
        child: Divider(),
      ),
    );
  }
}
