import 'package:lines/data/models/single_category_stats.dart';

class SymptomCategoryStats {
  final List<SingleCategoryStats> symptomsCategories;

  SymptomCategoryStats({
    required this.symptomsCategories,
  });

  factory SymptomCategoryStats.fromJson(Map<String, dynamic> json) {
    return SymptomCategoryStats(
      symptomsCategories: List<SingleCategoryStats>.from(
        json['symptoms_category_stats'].map(
          (singleCategoryStats) => SingleCategoryStats.fromJson(
            singleCategoryStats,
          ),
        ),
      ),
    );
  }
}
