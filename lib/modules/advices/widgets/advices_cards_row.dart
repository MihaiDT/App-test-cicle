import 'package:flutter/material.dart';
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
          child: InkWell(
            onTap: () {
              if (onCardTapped != null) {
                onCardTapped!(
                  articles[index],
                  categories[indexOfCategory],
                );
              }
            },
            child: _adviceCard(
              articles[index],
            ),
          ),
        );
      },
    );
  }

  Widget _adviceCard(AdvicesArticle article) {
    switch (article.typology) {
      case ArticleType.text:
        return AdviceCard(
          advicesCategory: article.getParentCategoryWithoutTitle,
          hasBorder: withBorder,
          text: article.title,
          imageUrl: article.thumbImageUrl,
        );
      case ArticleType.slider:
        return AdviceCard.withGallery(
          advicesCategory: article.getParentCategoryWithoutTitle,
          hasBorder: withBorder,
          text: article.title,
          imageUrl: article.thumbImageUrl,
        );
      case ArticleType.video:
        return AdviceCard.withTimer(
          timer: '0:00',
          advicesCategory: article.getParentCategoryWithoutTitle,
          hasBorder: withBorder,
          text: article.title,
          imageUrl: article.thumbImageUrl,
        );
    }
  }
}
