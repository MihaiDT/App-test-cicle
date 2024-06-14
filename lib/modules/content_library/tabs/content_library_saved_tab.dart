import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/advices/widgets/advice_card.dart';
import 'package:lines/modules/content_library/controllers/content_library_controller.dart';
import 'package:lines/widgets/loaders/dark_loader.dart';

class ContentLibrarySavedArticleTab extends GetView<ContentLibraryController> {
  const ContentLibrarySavedArticleTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      child: Obx(
        () {
          if (controller.pageShouldRefresh) {
            if (controller.savedArticles.isNotEmpty) {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
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
              return const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: BodyMedium(
                  "Non ci sono articoli salvati",
                  color: ThemeColor.darkBlue,
                ),
              );
            }
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
      ),
    );
  }
}
