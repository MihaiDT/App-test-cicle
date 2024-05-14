import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/advices/widgets/advices_cards_row.dart';

class ContentLibraryCategoryTabRows extends StatelessWidget {
  final Map<AdvicesCategory, List<AdvicesArticle>> allCategoriesWithArticles;
  final Function(AdvicesArticle, AdvicesCategory)? onCardTapped;

  const ContentLibraryCategoryTabRows({
    super.key,
    required this.allCategoriesWithArticles,
    this.onCardTapped,
  });

  @override
  Widget build(BuildContext context) {
    List<AdvicesCategory> allCategories =
        allCategoriesWithArticles.keys.toList();
    return ListView.separated(
      separatorBuilder: (context, index) => ThemeSizedBox.height32,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allCategoriesWithArticles.keys.length,
      itemBuilder: (context, index) {
        List<AdvicesArticle> allArticlesForCategory = [];
        if (allCategoriesWithArticles[allCategories[index]]?.isNotEmpty ==
            true) {
          allArticlesForCategory
              .addAll(allCategoriesWithArticles[allCategories[index]]!);
        }
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    allCategories[index].iconPath,
                    color: allCategories[index].categoryColor,
                  ),
                  TitleMedium(
                    allCategories[index].categoryTitle != null
                        ? allCategories[index].categoryTitle!.toUpperCase()
                        : "",
                    color: ThemeColor.darkBlue,
                  ),
                ],
              ),
            ),
            ThemeSizedBox.height4,
            Visibility(
              visible: allArticlesForCategory.isNotEmpty,
              child: SizedBox(
                height: 220,
                child: AdvicesCardsRow(
                  onCardTapped: onCardTapped,
                  articles: allArticlesForCategory,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
