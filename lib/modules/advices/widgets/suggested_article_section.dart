import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/delay.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_article_detail_pair.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/advices/widgets/advices_cards_row.dart';
import 'package:lines/routes/routes.dart';

class SuggestedArticleSection extends StatelessWidget {
  final List<AdvicesArticle> allSuggestedArticles;

  const SuggestedArticleSection({
    required this.allSuggestedArticles,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showSection,
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.lightGrey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ThemeSizedBox.height40,
            const TitleMedium(
              "TI POTREBBERO INTERESSARE ANCHE:",
              textAlign: TextAlign.center,
              color: ThemeColor.darkBlue,
            ),
            ThemeSizedBox.height12,
            SizedBox(
              height: 220,
              child: AdvicesCardsRow(
                onCardTapped: (article, category) =>
                    showSuggestedArticleDetails(article, category),
                withBorder: true,
                articles: allSuggestedArticles,
              ),
            ),
            ThemeSizedBox.height40,
          ],
        ),
      ),
    );
  }

  bool get showSection => allSuggestedArticles.isNotEmpty == true;

  void showSuggestedArticleDetails(
    AdvicesArticle article,
    AdvicesCategory category,
  ) async {
    // We have to go back and wait until the old ArticleDetail's deleted because it cannot be instantiated 2 or more times
    Get.back();
    await wait(milliseconds: 500);

    Get.toNamed(
      Routes.articleDetailPage,
      arguments: AdvicesDetailPair(
        category: category,
        article: article,
      ),
    );
  }
}
