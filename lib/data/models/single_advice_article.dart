import 'package:lines/data/models/advices_article.dart';

class SingleAdviceArticle {
  final String categoryName;
  final String subCategoryName;
  final AdvicesArticle article;

  SingleAdviceArticle({
    required this.categoryName,
    required this.subCategoryName,
    required this.article,
  });

  factory SingleAdviceArticle.fromJson(Map<String, dynamic> data) {
    return SingleAdviceArticle(
      categoryName: data['category_name'],
      subCategoryName: data['sub_category_name'],
      article: AdvicesArticle.fromJson(data),
    );
  }
}
