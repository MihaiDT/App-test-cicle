import 'package:flutter/material.dart';
import 'package:lines/data/models/advices_article.dart';

import '../../../core/app_theme.dart';
import 'advice_card.dart';

class AdvicesCardsRow extends StatelessWidget {
  final bool withBorder;
  final List<AdvicesArticle> articles;

  const AdvicesCardsRow({
    super.key,
    this.withBorder = false,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: articles.length,
      separatorBuilder: (context, index) {
        return ThemeSizedBox.width8;
      },
      itemBuilder: (context, index) {
        return SizedBox(
          width: 150,
          child: AdviceCard(
            advicesCategory: articles[index].getParentCategoryWithoutTitle,
            hasBorder: withBorder,
            text: articles[index].text ?? "",
          ),
        );
      },
    );
  }
}
