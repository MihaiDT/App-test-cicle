import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/advices/widgets/advice_card.dart';
import 'package:lines/modules/content_library/controllers/content_library_controller.dart';

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
              return AdviceCard(
                article: controller.savedArticles[index],
                onCardTap: controller.showArticleDetails,
              );
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
