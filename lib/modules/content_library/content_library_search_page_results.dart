import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/content_library/content_library_search_page_controller.dart';

import '../../data/models/advices_article.dart';
import '../advices/widgets/advice_card.dart';

class ContentLibrarySearchPageResults
    extends GetView<ContentLibrarySearchPageController> {
  const ContentLibrarySearchPageResults({super.key});

  @override
  Widget build(BuildContext context) {
    List<AdvicesArticle> allArticles = controller.resultsArticles;
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: allArticles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.67,
      ),
      itemBuilder: (context, index) {
        AdvicesCategory advicesCategory =
            AdvicesCategory.fromIconName(allArticles[index].iconName);
        int indexOfCategory = controller.categories.indexOf(advicesCategory);

        switch (allArticles[index].typology) {
          case ArticleType.text:
            return InkWell(
              onTap: () {
                controller.showArticleDetails(
                  allArticles[index],
                  controller.categories[indexOfCategory],
                );
              },
              child: AdviceCard(
                advicesCategory:
                    allArticles[index].getParentCategoryWithoutTitle,
                text: allArticles[index].title,
                imageUrl: allArticles[index].thumbImageUrl,
              ),
            );
          case ArticleType.video:
            return InkWell(
              onTap: () {
                controller.showArticleDetails(
                  allArticles[index],
                  controller.categories[indexOfCategory],
                );
              },
              child: AdviceCard.withTimer(
                timer: "0:00",
                advicesCategory:
                    allArticles[index].getParentCategoryWithoutTitle,
                text: allArticles[index].title,
                imageUrl: allArticles[index].thumbImageUrl,
              ),
            );
          case ArticleType.slider:
            return InkWell(
              onTap: () {
                controller.showArticleDetails(
                  allArticles[index],
                  controller.categories[indexOfCategory],
                );
              },
              child: AdviceCard.withGallery(
                advicesCategory:
                    allArticles[index].getParentCategoryWithoutTitle,
                text: allArticles[index].title,
                imageUrl: allArticles[index].thumbImageUrl,
              ),
            );
        }
      },
    );
  }
}
