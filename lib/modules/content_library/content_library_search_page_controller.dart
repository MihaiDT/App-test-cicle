import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/data/models/advices_category_with_articles.dart';

import '../../core/utils/singletons.dart';
import '../../data/models/advices_article_detail_pair.dart';
import '../../data/models/advices_sub_category.dart';
import '../../repository/advices_service.dart';
import '../../routes/routes.dart';
import '../advices/controllers/advices_detail_store.dart';

class ContentLibrarySearchPageController extends GetxController {
  final RxBool rxShowResults = false.obs;
  bool get showResults => rxShowResults.value;
  set showResults(bool newValue) {
    rxShowResults.value = newValue;
  }

  AdvicesDetailStore advicesDetailStore = Get.put(
    AdvicesDetailStore(),
  );

  final RxList<AdvicesArticle> rxResultsArticles = <AdvicesArticle>[].obs;
  List<AdvicesArticle> get resultsArticles => rxResultsArticles;

  final TextEditingController textEditingController = TextEditingController();

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

  /// Extracts and returns a list of AdvicesCategory objects from the advicesCategories response
  List<AdvicesCategory> get categories {
    List<AdvicesCategory> categories = [];
    if (appController.advicesCategories.value != null) {
      for (MapEntry<String, AdvicesCategoryWithArticles> entry
          in appController.advicesCategories.value!.categories.entries) {
        AdvicesCategoryWithArticles advicesCategoryWithArticles = entry.value;
        categories.add(advicesCategoryWithArticles.advicesCategory);
      }
    }
    return categories;
  }

  /// Returns a list of AdvicesSubCategory objects for a given category iconPath
  List<AdvicesSubCategory>? subCategoriesForCategory(String iconPath) {
    return appController
        .advicesCategories.value?.categories[iconPath]?.subCategories;
  }

  /// Retrieves the article name for a given subCategoryIndex within a specific category
  String articleNameFromSubCategoryFromIndex(
      String iconName, int subCategoryIndex) {
    List<AdvicesSubCategory>? subCatories = subCategoriesForCategory(iconName);
    if (subCatories != null) {
      return subCatories[subCategoryIndex].subCategoryName;
    }
    return "";
  }

  void onSubCategoryTapped(AdvicesSubCategory subCategory) {
    textEditingController.text = subCategory.subCategoryName;
    resultsArticles.clear();
    resultsArticles.addAll(subCategory.articles);
    showResults = true;
  }

  void onTextFieldClearTapped() {
    textEditingController.clear();
    showResults = false;
  }
}
