import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_article_detail_pair.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/data/models/advices_category_with_articles.dart';
import 'package:lines/data/models/advices_sub_category.dart';
import 'package:lines/repository/advices_service.dart';
import 'package:lines/routes/routes.dart';

class AdvicesController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    if (!appController.advicesCategories.responseHandler.isSuccessful) {
      await AdvicesService.fetchArticles();
    }
  }

  bool get pageShouldRefresh {
    return appController.advicesCategories.responseHandler.isSuccessful;
  }

  void showArticleDetails(AdvicesArticle article, AdvicesCategory category) {
    Get.toNamed(
      Routes.articleDetailPage,
      arguments: AdvicesDetailPair(
        category: category,
        article: article,
      ),
    );
  }

  /// Retrieve all categories
  List<AdvicesCategory> get getAllCategories {
    List<AdvicesCategory> allCategories = [];
    if (appController.advicesCategories.value != null) {
      for (MapEntry<String, AdvicesCategoryWithArticles> entry
          in appController.advicesCategories.value!.categories.entries) {
        allCategories.add(entry.value.advicesCategory);
      }
    }
    return allCategories;
  }

  /// Retrieve all articles from every category
  List<AdvicesArticle> get getAllArticles {
    List<AdvicesArticle> list = [];
    if (appController.advicesCategories.value != null) {
      for (MapEntry<String, AdvicesCategoryWithArticles> entry
          in appController.advicesCategories.value!.categories.entries) {
        AdvicesSubCategory firstSubCategory = entry.value.subCategories[0];
        for (AdvicesArticle article in firstSubCategory.articles) {
          list.add(article);
        }
      }
    }
    return list;
  }
}
