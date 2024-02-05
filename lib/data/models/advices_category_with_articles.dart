import 'package:lines/data/models/advices_category.dart';

import 'advices_sub_category.dart';

class AdvicesCategoryWithArticles {
  final AdvicesCategory advicesCategory;
  final List<AdvicesSubCategory> subCategories;

  AdvicesCategoryWithArticles({
    required this.advicesCategory,
    required this.subCategories,
  });

  factory AdvicesCategoryWithArticles.fromJson(Map<String, dynamic> data) {
    final AdvicesCategory newCategory = AdvicesCategory.fromJson(
      data['category'],
    );
    List<AdvicesSubCategory> subCategoriesList = [];
    for (var articleCategory in data['article_categories']) {
      final AdvicesSubCategory advicesSubCategory =
          AdvicesSubCategory.fromJson(articleCategory);
      subCategoriesList.add(advicesSubCategory);
    }
    return AdvicesCategoryWithArticles(
      advicesCategory: newCategory,
      subCategories: subCategoriesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'advicesCategory': advicesCategory.toJson(),
      'subCategories':
          subCategories.map((subCategory) => subCategory.toJson()).toList(),
    };
  }
}
