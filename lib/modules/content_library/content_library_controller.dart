import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/singletons.dart';
import '../../data/models/advices_article.dart';
import '../../data/models/advices_category_with_articles.dart';
import '../../data/models/advices_sub_category.dart';
import '../../repository/advices_service.dart';

class ContentLibraryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

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

  List<AdvicesArticle> get getAllArticles {
    List<AdvicesArticle> list = [];
    if (appController.advicesCategories.value != null) {
      for (MapEntry<String, AdvicesCategoryWithArticles> entry
          in appController.advicesCategories.value!.categories.entries) {
        for (AdvicesSubCategory subcategory in entry.value.subCategories) {
          for (AdvicesArticle article in subcategory.articles) {
            list.add(article);
          }
        }
      }
    }
    return list;
  }

  bool get pageShouldRefresh {
    return appController.advicesCategories.responseHandler.isSuccessful;
  }
}
