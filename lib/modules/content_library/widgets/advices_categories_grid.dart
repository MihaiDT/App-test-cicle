import 'package:flutter/material.dart';

import '../../../data/enums/advices_category.dart';
import '../../advices/widgets/advices_category_container.dart';

class AdvicesCategoriesGrid extends StatelessWidget {
  const AdvicesCategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      shrinkWrap: true,
      itemCount: AdvicesCategory.values.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.8,
      ),
      itemBuilder: (context, index) {
        return AdvicesCategoryContainer(
          advicesCategory: AdvicesCategory.values[index],
        );
      },
    );
  }
}
