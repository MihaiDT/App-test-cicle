import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/singletons.dart';
import '../../data/models/advices_article.dart';
import '../../data/models/advices_article_detail_pair.dart';
import '../../data/models/advices_category.dart';
import '../../data/models/advices_category_with_articles.dart';
import '../../data/models/advices_sub_category.dart';
import '../../repository/advices_service.dart';
import '../../routes/routes.dart';
import '../advices/controllers/advices_detail_store.dart';

class ContentLibraryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  AdvicesDetailStore advicesDetailStore = Get.put(
    AdvicesDetailStore(),
  );

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  void onReady() async {
    super.onReady();
    await AdvicesService.fetchArticles();
  }

  void showArticleDetails(AdvicesArticle article, AdvicesCategory category) {
    advicesDetailStore.articleDetail = AdvicesDetailPair(
      category: category,
      article: article,
    );
    Get.toNamed(Routes.articleDetailPage);
  }

  bool get pageShouldRefresh {
    return appController.advicesCategories.responseHandler.isSuccessful;
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

  /// Retrieve all categories with their associated articles
  Map<AdvicesCategory, List<AdvicesArticle>> get getAllCategoriesWithArticles {
    Map<AdvicesCategory, List<AdvicesArticle>> allCategoriesWithArticles = {};
    if (appController.advicesCategories.value != null) {
      for (MapEntry<String, AdvicesCategoryWithArticles> entry
          in appController.advicesCategories.value!.categories.entries) {
        AdvicesCategory category = entry.value.advicesCategory;
        List<AdvicesArticle> articlesForCategory = [];
        AdvicesSubCategory firstSubCategory = entry.value.subCategories[0];

        for (AdvicesArticle article in firstSubCategory.articles) {
          articlesForCategory.add(article);
        }

        allCategoriesWithArticles[category] = articlesForCategory;
      }
    }
    return allCategoriesWithArticles;
  }
}
