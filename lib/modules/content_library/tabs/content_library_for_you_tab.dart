import 'package:flutter/material.dart';
import 'package:lines/data/enums/advices_category.dart';
import 'package:lines/modules/advices/widgets/advice_card.dart';

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
            advicesCategory: AdvicesCategory.ginecologia,
            text: 'Quando arriverà il mio primo ciclo?');
      },
    );
  }
}
