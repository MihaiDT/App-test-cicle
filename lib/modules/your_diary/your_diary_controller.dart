import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/symtpom_category_stats.dart';
import 'package:lines/repository/menses_service.dart';

class YourDiaryController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();
    if (!appController.symptomCategoryStats.responseHandler.isSuccessful) {
      await MensesService.mensesStatistics;
    }
  }

  SymptomCategoryStats? get symptomCategoryStats =>
      appController.symptomCategoryStats.value;
}
