import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/single_category_stats.dart';
import 'package:lines/data/models/symptom.dart';
import 'package:lines/repository/menses_service.dart';
import 'package:lines/routes/routes.dart';

class YourDiarySectionController extends GetxController {
  @override
  void onReady() async {
    if (!appController.symptomCategoryStats.responseHandler.isSuccessful) {
      await MensesService.mensesStatistics;
    }
    super.onReady();
  }

  bool get isUserAdult => appController.user.value?.hasMoreThan18Years ?? false;

  // todo: implement with the correct symptoms
  List<Symptom> get mostFrequentSymptoms => [];

  List<SingleCategoryStats>? get symptomCategories =>
      appController.symptomCategoryStats.value?.symptomsCategories
          .where(
            (element) => element.enabled == true,
          )
          .toList() ??
      [];

  Future<void> onSymptomCategoryPressed(
    SingleCategoryStats? symptomCategory,
  ) async {
    if (symptomCategory != null) {
      await MensesService.getSymptomsCategoryStatistics(symptomCategory.id);
      Get.toNamed(Routes.chartsAndStaticsPage);
    }
  }

  bool get hasSavedSymptoms => symptomCategories?.isNotEmpty ?? false;
}
