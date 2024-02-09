import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/modules/advices/advices_detail_store.dart';
import 'package:lines/modules/advices/widgets/advices_slider_article_detail.dart';
import 'package:lines/modules/advices/widgets/advices_text_article_detail.dart';
import 'package:lines/modules/advices/widgets/advices_video_article_detail.dart';

class AdvicesDetailPage extends GetView<AdvicesDetailStore> {
  const AdvicesDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.articleDetail != null) {
          switch (controller.articleDetail!.article.typology) {
            case (ArticleType.text):
              return AdvicesTextArticleDetails(
                category: controller.articleDetail!.category,
                article: controller.articleDetail!.article,
              );
            case (ArticleType.slider):
              return AdvicesSliderArticleDetail(
                category: controller.articleDetail!.category,
                article: controller.articleDetail!.article,
              );
            case (ArticleType.video):
              return AdvicesVideoArticleDetail(
                category: controller.articleDetail!.category,
                article: controller.articleDetail!.article,
              );
          }
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
