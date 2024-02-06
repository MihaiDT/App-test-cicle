import 'package:flutter/material.dart';
import 'package:lines/modules/advices/widgets/advice_card.dart';

import '../../../data/models/advices_category.dart';

class ContentLibraryForYouTab extends StatelessWidget {
  const ContentLibraryForYouTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      scrollDirection: Axis.vertical,
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.67),
      itemBuilder: (context, index) {
        return AdviceCard(
            advicesCategory: AdvicesCategory.fromIconName('ginecologia.svg'),
            text: 'Quando arriverà il mio primo ciclo?');
      },
    );
  }
}
