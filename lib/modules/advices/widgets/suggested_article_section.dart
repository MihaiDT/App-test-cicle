import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/advices/controllers/suggested_article_section_controller.dart';
import 'package:lines/modules/advices/widgets/advices_cards_row.dart';

class SuggestedArticleSection
    extends GetView<SuggestedArticleSectionController> {
  const SuggestedArticleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.showSection,
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
                    controller.showArticleDetails(article, category),
                withBorder: true,
                articles: controller.allSuggestedArticles,
              ),
            ),
            ThemeSizedBox.height40,
          ],
        ),
      ),
    );
  }
}
