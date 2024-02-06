import 'package:flutter/material.dart';

import 'package:lines/modules/content_library/widgets/content_library_category_tab_rows.dart';
import '../../../core/app_theme.dart';
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
        const ContentLibraryCategoryTabRows(),
      ],
    );
  }
}
