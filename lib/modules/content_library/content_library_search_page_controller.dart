import 'package:get/get.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/data/models/advices_category_with_articles.dart';

import '../../core/utils/singletons.dart';
import '../../data/models/advices_sub_category.dart';
import '../../repository/advices_service.dart';

class ContentLibrarySearchPageController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await AdvicesService.fetchArticles();
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
}
