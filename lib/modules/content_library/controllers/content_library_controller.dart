import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_article_detail_pair.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/data/models/advices_category_with_articles.dart';
import 'package:lines/data/models/advices_sub_category.dart';
import 'package:lines/repository/advices_service.dart';
import 'package:lines/routes/routes.dart';

class ContentLibraryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  Rxn<AdvicesCategory> selectedCategory = Rxn<AdvicesCategory>();
  final RxInt selectedIndex = RxInt(0);

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
    if (!appController.advicesCategories.responseHandler.isSuccessful) {
      await AdvicesService.fetchArticles();
    }
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

  void showCategoryPage(AdvicesCategory category) {
    selectedCategory.value = category;
    Get.toNamed(Routes.contentLibraryCategoryPage);
  }

  bool get pageShouldRefresh {
    return appController.advicesCategories.responseHandler.isSuccessful;
  }

  /// Retrieve all articles from every category
  List<AdvicesArticle> get getAllArticles {
    return appController.advicesCategories.value?.categories.entries
            .expand((entry) => entry.value.subCategories[0].articles)
            .toList() ??
        [];
  }

  /// Retrieve all categories
  List<AdvicesCategory> get getAllCategories {
    return appController.advicesCategories.value?.categories.entries
            .map((entry) => entry.value.advicesCategory)
            .toList() ??
        [];
  }

  /// Retrieves all articles for a specific category.
  List<AdvicesArticle> getAllArticleForCategory(AdvicesCategory category) {
    return appController.advicesCategories.value?.categories[category.iconName]
            ?.subCategories[0].articles ??
        [];
  }

  /// Retrieves all saved articles.
  List<AdvicesArticle> get savedArticles {
    return getAllArticles.where((article) => article.isFavorite).toList();
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
