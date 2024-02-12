import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/advices/widgets/advice_card.dart';
import 'package:lines/modules/content_library/controllers/content_library_controller.dart';

class ContentLibraryForYouTab extends GetView<ContentLibraryController> {
  const ContentLibraryForYouTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.pageShouldRefresh) {
          List<AdvicesArticle> allArticles = controller.getAllArticles;
          List<AdvicesCategory> allCategories = controller.getAllCategories;
          return GridView.builder(
            padding: const EdgeInsets.all(16),
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
              int indexOfCategory =
                  controller.getAllCategories.indexOf(advicesCategory);
              switch (allArticles[index].typology) {
                case ArticleType.text:
                  return AdviceCard(
                    onCardTap: controller.showArticleDetails,
                    article: allArticles[index],
                    category: allCategories[indexOfCategory],
                    text: allArticles[index].title,
                    imageUrl: allArticles[index].thumbImageUrl,
                  );
                case ArticleType.video:
                  return AdviceCard.withTimer(
                    onCardTap: controller.showArticleDetails,
                    article: allArticles[index],
                    timer: "0:00",
                    category: allCategories[indexOfCategory],
                    text: allArticles[index].title,
                    imageUrl: allArticles[index].thumbImageUrl,
                  );
                case ArticleType.slider:
                  return AdviceCard.withGallery(
                    onCardTap: controller.showArticleDetails,
                    article: allArticles[index],
                    category: allCategories[indexOfCategory],
                    text: allArticles[index].title,
                    imageUrl: allArticles[index].thumbImageUrl,
                  );
              }
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
