import 'package:flutter/material.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/advices_article.dart';

import '../../../core/app_theme.dart';

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
        int indexOfCategory = categories.indexOf(
          articles[index].getParentCategoryWithoutTitle,
        );
        return SizedBox(
          width: 150,
          child: _adviceCard(
            articles[index],
            categories[indexOfCategory],
          ),
        );
      },
    );
  }

  Widget _adviceCard(AdvicesArticle article, AdvicesCategory category) {
    switch (article.typology) {
      case ArticleType.text:
        return AdviceCard(
          onCardTap: onCardTapped,
          article: article,
          category: category,
          hasBorder: withBorder,
          text: article.title,
          imageUrl: article.thumbImageUrl,
        );
      case ArticleType.slider:
        return AdviceCard.withGallery(
          onCardTap: onCardTapped,
          article: article,
          category: category,
          hasBorder: withBorder,
          text: article.title,
          imageUrl: article.thumbImageUrl,
        );
      case ArticleType.video:
        return AdviceCard.withTimer(
          onCardTap: onCardTapped,
          article: article,
          category: category,
          timer: '0:00',
          hasBorder: withBorder,
          text: article.title,
          imageUrl: article.thumbImageUrl,
        );
    }
  }
}
