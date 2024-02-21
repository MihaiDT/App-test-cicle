import 'package:flutter/material.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/data/models/info_group.dart';
import 'package:lines/data/models/info_product.dart';
import 'package:lines/modules/info/widgets/info_dropdown_item.dart';
import 'package:lines/modules/info/widgets/info_drowdown_sub_header.dart';
import 'package:lines/widgets/dropdown/dropdown.dart';

class InfoDropDown extends StatelessWidget {
  final List<InfoGroup> groups;

  const InfoDropDown({
    required this.groups,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropDown(
      title: groups[0].title,
      child: Column(
        children: [
          const Divider(),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: groups.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _itemsAndTitle(products: groups[index].products);
              }
              return _itemsAndTitle(
                headerText: groups[index].title,
                products: groups[index].products,
              );
            },
            separatorBuilder: (context, index) => Column(
              children: [
                const Divider(),
                ThemeSizedBox.height24,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemsAndTitle(
      {String? headerText, required List<InfoProduct> products}) {
    if (headerText != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InfoDropDownSubHeader(
            title: headerText,
          ),
          const Divider(),
          _items(products),
        ],
      );
    }
    return _items(products);
  }

  Widget _items(List<InfoProduct> products) {
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
