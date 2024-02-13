import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/data/models/advices_category_with_articles.dart';

import '../../../core/utils/singletons.dart';
import '../../../data/models/advices_article_detail_pair.dart';
import '../../../data/models/advices_sub_category.dart';
import '../../../repository/advices_service.dart';
import '../../../routes/routes.dart';
import '../../advices/controllers/advices_detail_store.dart';

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

  RxBool forceResults = false.obs;
  RxString text = "".obs;

  ///if block will handle results that are shown when user taps on a category,
  ///else block will handle results when user types something inside the textfield
  List<AdvicesArticle> get resultsArticles {
    if (forceResults.value) {
      return rxResultsArticles;
    } else {
      String textToFilter = textEditingController.text.toLowerCase();
      rxResultsArticles.clear();
      rxResultsArticles.addAll(getAllArticles);
      return rxResultsArticles.where((article) {
        return _articleContainsText(article, textToFilter);
      }).toList();
    }
  }

  ///returns true if the article contains in the title text or in the subcategory name or in the category name
  ///the string textToFilter, also if the article is of type text check inside the text property , false otherwise
  bool _articleContainsText(AdvicesArticle article, String textToFilter) {
    bool condition =
        article.title.toLowerCase().contains(textToFilter.toLowerCase()) ||
            article.subCategoryName.toLowerCase().contains(textToFilter) ||
            article.categoryName.toLowerCase().contains(textToFilter);
    //if the article is of type text che inside the text property
    if (article.typology == ArticleType.text) {
      return condition = condition ||
          article.text?.toLowerCase().contains(textToFilter) == true;
    }
    return condition;
  }

  final TextEditingController textEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    textEditingController.addListener(() {
      _listenForTyping();
    });
  }

  @override
  void onReady() async {
    super.onReady();
    await AdvicesService.fetchArticles();
  }

  ///listener for textfield , if the text as more then 4 character show the results
  void _listenForTyping() {
    if (!forceResults.value) {
      if (textEditingController.text.length > 4) {
        showResults = true;
      } else {
        showResults = false;
      }
    }
    text.value = textEditingController.text;
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

  void onSubCategoryTapped(AdvicesSubCategory subCategory) {
    forceResults.value = true;
    textEditingController.text = subCategory.subCategoryName;
    resultsArticles.clear();
    resultsArticles.addAll(subCategory.articles);
    showResults = true;
  }

  void onTextFieldClearTapped() {
    textEditingController.clear();
    showResults = false;
    forceResults.value = false;
  }
}
