import 'package:flutter/material.dart';
import 'package:lines/data/models/info_product.dart';
import 'package:lines/modules/info/widgets/info_dropdown_item.dart';

class InfoDropDownProductsList extends StatelessWidget {
  final List<InfoProduct> products;

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
        text: products[index].text,
        coinAmount: products[index].coinAmount,
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
