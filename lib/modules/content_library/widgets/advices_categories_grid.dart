import 'package:flutter/material.dart';

import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/advices/widgets/advices_category_container.dart';

class AdvicesCategoriesGrid extends StatelessWidget {
  final List<AdvicesCategory> categories;
  final Function(AdvicesCategory)? onCategoryTapped;

  const AdvicesCategoriesGrid({
    required this.categories,
    this.onCategoryTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.8,
      ),
      itemBuilder: (context, index) {
        return AdvicesCategoryContainer(
          onCategoryTapped: onCategoryTapped,
          advicesCategory: categories[index],
        );
      },
    );
  }
}
