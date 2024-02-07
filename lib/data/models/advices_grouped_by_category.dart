import 'package:lines/data/models/advices_category_with_articles.dart';

class AdvicesGroupedByCategory {
  final Map<String, AdvicesCategoryWithArticles> categories;

  AdvicesGroupedByCategory._({
    required this.categories,
  });

  factory AdvicesGroupedByCategory.fromJson(Map<String, dynamic> data) {
    Map<String, AdvicesCategoryWithArticles> map = {};
    for (var categoriesWithArticles in data['group_by_categories']) {
      AdvicesCategoryWithArticles advicesCategoryWithArticles =
          AdvicesCategoryWithArticles.fromJson(
        categoriesWithArticles,
      );
      map[advicesCategoryWithArticles.advicesCategory.iconName] =
          advicesCategoryWithArticles;
    }
    return AdvicesGroupedByCategory._(
      categories: map,
    );
  }
}
