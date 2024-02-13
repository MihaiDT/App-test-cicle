import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/content_library/controllers/content_library_controller.dart';

import '../../../data/models/advices_article.dart';
import '../../../data/models/advices_category.dart';
import '../../advices/widgets/advice_card.dart';

class ContentLibrarySavedArticleTab extends GetView<ContentLibraryController> {
  const ContentLibrarySavedArticleTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.pageShouldRefresh) {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: controller.savedArticles.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 0.67,
            ),
            itemBuilder: (context, index) {
              int indexOfCategory = controller.getAllCategories.indexOf(
                AdvicesCategory.fromIconName(
                  controller.savedArticles[index].iconName,
                ),
              );
              AdvicesCategory category =
                  controller.getAllCategories[indexOfCategory];

              switch (controller.savedArticles[index].typology) {
                case ArticleType.text:
                  return AdviceCard(
                    onCardTap: controller.showArticleDetails,
                    article: controller.savedArticles[index],
                    category: category,
                    text: controller.savedArticles[index].title,
                    imageUrl: controller.savedArticles[index].thumbImageUrl,
                  );
                case ArticleType.video:
                  return AdviceCard.withTimer(
                    onCardTap: controller.showArticleDetails,
                    article: controller.savedArticles[index],
                    category: category,
                    timer: "0:00",
                    text: controller.savedArticles[index].title,
                    imageUrl: controller.savedArticles[index].thumbImageUrl,
                  );
                case ArticleType.slider:
                  return AdviceCard.withGallery(
                    onCardTap: controller.showArticleDetails,
                    article: controller.savedArticles[index],
                    category: category,
                    text: controller.savedArticles[index].title,
                    imageUrl: controller.savedArticles[index].thumbImageUrl,
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
