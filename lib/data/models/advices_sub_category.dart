import 'advices_article.dart';

class AdvicesSubCategory {
  final String subCategoryName;
  final List<AdvicesArticle> articles;

  AdvicesSubCategory({
    required this.subCategoryName,
    required this.articles,
  });

  factory AdvicesSubCategory.fromJson(Map<String, dynamic> data) {
    List<AdvicesArticle> articles = [];
    for (var article in data['articles']) {
      AdvicesArticle newArticle = AdvicesArticle.fromJson(article);
      articles.add(newArticle);
    }
    return AdvicesSubCategory(
      subCategoryName: data['category']['name'],
      articles: articles,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subCategoryName': subCategoryName,
      'articles': articles.map((article) => article.toJson()).toList(),
    };
  }
}
