import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/modules/advices/controllers/advices_detail_controller.dart';
import 'package:lines/modules/advices/widgets/advices_slider_article_detail.dart';
import 'package:lines/modules/advices/widgets/advices_text_article_detail.dart';
import 'package:lines/modules/advices/widgets/advices_video_article_detail.dart';

class AdvicesDetailPage extends GetView<AdvicesDetailController> {
  const AdvicesDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (controller.articleDetail != null) {
      switch (controller.articleDetail!.article.typology) {
        case (ArticleType.text):
          return Obx(
            () {
              return AdvicesTextArticleDetails(
                category: controller.category,
                article: controller.article,
                isArticleFav: controller.isArticleFav.value,
                onFavChanged: (isFav) =>
                    controller.updateArticleFavStatus(isFav),
                id: controller.article?.id ?? "",
                allSuggestedArticles: controller.allSuggestedArticles,
              );
            },
          );
        case (ArticleType.slider):
          return Obx(
            () {
              return AdvicesSliderArticleDetail(
                category: controller.category,
                article: controller.article,
                isArticleFav: controller.isArticleFav.value,
                images: controller.getSliderImages,
                currentSlide: controller.currentSlide.value,
                id: controller.article?.id ?? "",
                onFavChanged: (isFav) =>
                    controller.updateArticleFavStatus(isFav),
                onSlideChanged: (value) => controller.onSlideChanged(value),
                allSuggestedArticles: controller.allSuggestedArticles,
              );
            },
          );
        case (ArticleType.video):
          return AdvicesVideoArticleDetail(
            allSuggestedArticles: controller.allSuggestedArticles,
          );
      }
    } else {
      return const SizedBox.shrink();
    }
  }
}
