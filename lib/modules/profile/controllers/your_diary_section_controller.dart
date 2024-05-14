import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/symptom.dart';
import 'package:lines/data/models/symptom_category.dart';

class YourDiarySectionController extends GetxController {
  bool get isUserAdult => appController.user.value?.hasMoreThan18Years ?? false;

  // todo: implement with the correct symptoms
  List<Symptom> get mostFrequentSymptoms => [];

  List<SymptomCategory> get symptomCategories =>
      appController.symptomCategory.value ?? [];
}
