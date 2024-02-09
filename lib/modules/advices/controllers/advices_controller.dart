import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/advices/controllers/advices_detail_store.dart';

import 'package:lines/repository/advices_service.dart';
import 'package:lines/routes/routes.dart';

import '../../../core/utils/singletons.dart';
import '../../../data/models/advices_article.dart';
import '../../../data/models/advices_article_detail_pair.dart';
import '../../../data/models/advices_category_with_articles.dart';
import '../../../data/models/advices_sub_category.dart';

class AdvicesController extends GetxController {
  AdvicesDetailStore advicesDetailStore = Get.put(
    AdvicesDetailStore(),
  );

  @override
  void onReady() async {
    super.onReady();
    await AdvicesService.fetchArticles();
  }

  bool get pageShouldRefresh {
    return appController.advicesCategories.responseHandler.isSuccessful;
  }

  void showArticleDetails(AdvicesArticle article, AdvicesCategory category) {
    debugPrint('${category.categoryTitle}');
    advicesDetailStore.articleDetail = AdvicesDetailPair(
      category: category,
      article: article,
    );
    Get.toNamed(Routes.articleDetailPage);
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
