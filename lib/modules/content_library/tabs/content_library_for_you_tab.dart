import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_article.dart';

import 'package:lines/modules/advices/widgets/advice_card.dart';
import 'package:lines/modules/content_library/controllers/content_library_controller.dart';
import 'package:lines/widgets/loaders/dark_loader.dart';

class ContentLibraryForYouTab extends GetView<ContentLibraryController> {
  const ContentLibraryForYouTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.pageShouldRefresh) {
          List<AdvicesArticle> allArticles = controller.getAllArticles;
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
              return AdviceCard(
                onCardTap: controller.showArticleDetails,
                article: allArticles[index],
              );
            },
          );
        } else {
          return Center(
            child: SizedBox(
              height: Get.width * 0.15,
              width: Get.width * 0.15,
              child: const DarkLoader(),
            ),
          );
        }
      },
    );
  }
}
