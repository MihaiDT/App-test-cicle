import 'package:flutter/material.dart';
import 'package:lines/data/models/product_category.dart';
import 'package:lines/modules/info/widgets/info_dropdown_items_list.dart';
import 'package:lines/widgets/expandable/expandable.dart';

class InfoDropDown extends StatelessWidget {
  final ProductCategory category;

  const InfoDropDown({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expandable(
      title: category.category,
      child: Column(
        children: [
          const Divider(),
          InfoDropDownProductsList(
            products: category.products,
          ),
        ],
      ),
    );
  }
}
