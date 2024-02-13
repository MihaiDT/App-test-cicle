import 'package:flutter/material.dart';

import '../../../core/app_theme.dart';
import '../../../data/models/advices_article.dart';
import '../../../data/models/advices_category.dart';
import 'advice_card.dart';

class AdvicesCardsRow extends StatelessWidget {
  final bool withBorder;
  final List<AdvicesArticle> articles;
  final List<AdvicesCategory> categories;
  final Function(AdvicesArticle, AdvicesCategory)? onCardTapped;

  const AdvicesCardsRow({
    this.onCardTapped,
    this.withBorder = false,
    required this.articles,
    required this.categories,
    super.key,
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
            article: articles[index],
            onCardTap: onCardTapped,
            hasBorder: withBorder,
          ),
        );
      },
    );
  }
}
