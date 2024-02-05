import 'package:flutter/material.dart';

import '../../../core/app_theme.dart';
import '../../../data/enums/advices_category.dart';
import '../widgets/advices_cards_row.dart';
import '../widgets/advices_categories_grid.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        const AdvicesCategoriesGrid(),
        ThemeSizedBox.height24,
        _listOfCategories,
      ],
    );
  }

  Widget get _listOfCategories {
    return ListView.separated(
      separatorBuilder: (context, index) => ThemeSizedBox.height32,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: AdvicesCategory.values.length,
      itemBuilder: (context, index) {
        return AdvicesCardsRow(
          category: AdvicesCategory.values[index],
        );
      },
    );
  }
}
