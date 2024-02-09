import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/modules/advices/controllers/advices_detail_store.dart';
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
              return const AdvicesTextArticleDetails();
            case (ArticleType.slider):
              return const AdvicesSliderArticleDetail();
            case (ArticleType.video):
              return const AdvicesVideoArticleDetail();
          }
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
