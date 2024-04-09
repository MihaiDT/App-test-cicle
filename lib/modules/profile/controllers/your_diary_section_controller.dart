import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/new_symptom.dart';
import 'package:lines/data/models/symptom_category.dart';

class YourDiarySectionController extends GetxController {
  // todo: implement with the correct symptoms
  List<NewSymptom> get mostFrequentSymptoms => [];

  List<SymptomCategory> get symptomCategories =>
      appController.symptomCategory.value ?? [];
}
