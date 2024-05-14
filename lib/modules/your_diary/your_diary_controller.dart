import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/symtpom_category_stats.dart';
import 'package:lines/repository/menses_service.dart';
import 'package:lines/routes/routes.dart';

class YourDiaryController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();
    await MensesService.mensesStatistics;
  }

  SymptomCategoryStats? get symptomCategoryStats =>
      appController.symptomCategoryStats.value;

  Future<void> onSymptomCategoryPressed(String symptomCategoryId) async {
    await MensesService.getSymptomsCategoryStatistics(symptomCategoryId);
    Get.toNamed(Routes.chartsAndStaticsPage);
  }
}
