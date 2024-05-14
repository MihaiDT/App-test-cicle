import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/menses_statistics.dart';
import 'package:lines/data/models/symptom.dart';
import 'package:lines/modules/charts_and_statistics/widgets/filter_symptoms_bottomsheet.dart';

class ChartsAndStatisticsController extends GetxController {
  List<MensesStatistics> get mensesStatistics =>
      appController.mensesStatistics.value ?? [];

  List<Symptom> get symptoms =>
      appController.symptomCategory.value?.elementAt(2).symptoms ?? [];

  /// If null means that all symptoms are selected
  Symptom? selectedSymptom;

  Future<void> onFilterSectionTapped() async {
    selectedSymptom = await Get.bottomSheet(
      FilterSymptomsBottomSheet(
        symptoms: symptoms,
        selectedSymptom: selectedSymptom,
      ),
    );
  }
}
