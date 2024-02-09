import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_category.dart';

class AdvicesDetailPair {
  final AdvicesCategory category;
  final AdvicesArticle article;

  AdvicesDetailPair({
    required this.category,
    required this.article,
  });
}
