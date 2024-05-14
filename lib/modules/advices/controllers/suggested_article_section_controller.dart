import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_article_detail_pair.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/routes/routes.dart';

class SuggestedArticleSectionController extends GetxController {
  bool get showSection => allSuggestedArticles.isNotEmpty == true;

  List<AdvicesArticle> get allSuggestedArticles =>
      appController.suggestedAdvicesArticle.value ?? [];

  void showArticleDetails(AdvicesArticle article, AdvicesCategory category) {
    Get.offAndToNamed(
      Routes.articleDetailPage,
      arguments: AdvicesDetailPair(
        category: category,
        article: article,
      ),
    );
  }
}
