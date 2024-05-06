import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/symptom_diaries.dart';

class HistoryController extends GetxController {
  SymptomDiaries? get symptomsDiaries => appController.symptomsDiaries.value;
}
