import 'package:flutter/material.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/data/models/info_group.dart';
import 'package:lines/modules/info/widgets/info_dropdown_items_list.dart';
import 'package:lines/modules/info/widgets/info_drowdown_sub_header.dart';
import 'package:lines/widgets/expandable/expandable.dart';

class InfoDropDown extends StatelessWidget {
  final List<InfoGroup> groups;

  const InfoDropDown({
    required this.groups,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expandable(
      title: groups[0].title,
      child: Column(
        children: [
          const Divider(),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: groups.length,
            separatorBuilder: (context, index) => Column(
              children: [
                const Divider(),
                ThemeSizedBox.height24,
              ],
            ),
            itemBuilder: (context, index) {
              if (index == 0) {
                return InfoDropDownProductsList(
                  products: groups[index].products,
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InfoDropDownSubHeader(
                    title: groups[index].title,
                  ),
                  const Divider(),
                  InfoDropDownProductsList(
                    products: groups[index].products,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
