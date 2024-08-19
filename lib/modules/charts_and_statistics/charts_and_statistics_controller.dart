import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/menses_statistics.dart';
import 'package:lines/data/models/symptom.dart';
import 'package:lines/modules/charts_and_statistics/widgets/filter_symptoms_bottomsheet.dart';

class ChartsAndStatisticsController extends GetxController {
  List<MensesStatistics> get stateMensesStatistics =>
      List<MensesStatistics>.from(
        appController.mensesStatistics.value ?? [],
      );

  RxList<MensesStatistics> updatedMensesStatistics = <MensesStatistics>[].obs;
  Rx<Symptom?>? selectedSymptom;

  late final String symptomCategoryName;

  @override
  void onInit() {
    selectedSymptom = Rx<Symptom?>(null);
    symptomCategoryName = Get.arguments['symptomCategoryName'] ?? '';
    updatedMensesStatistics.value = List.from(stateMensesStatistics);
    super.onInit();
  }

  List<Symptom> get symptomsCategory {
    List<Symptom> symptoms = [];
    for (int i = 0; i < stateMensesStatistics.length; i++) {
      for (int j = 0;
          j < stateMensesStatistics[i].symptomPeriodStatistics.length;
          j++) {
        symptoms
            .add(stateMensesStatistics[i].symptomPeriodStatistics[j].symptom);
      }
    }

    return symptoms.toSet().toList();
  }

  Future<Symptom?> onFilterSectionTapped({
    required List<Symptom> symptoms,
  }) async {
    final Symptom? symptom = await Get.bottomSheet(
      FilterSymptomsBottomSheet(
        symptoms: symptoms,
        selectedSymptom: selectedSymptom?.value,
      ),
    );

    return symptom;
  }

  void updateMensesStatistics(Symptom? selectedSymptom) {
    List<MensesStatistics> resultList = [];
    updatedMensesStatistics.value = List.from(stateMensesStatistics);
    if (selectedSymptom == null) {
      resultList = updatedMensesStatistics.value;
    } else {
      resultList = updatedMensesStatistics.value
          .map((element) {
            // Filter the symptomPeriodStatistics for each MensesStatistics element
            var filteredStatistics = element.symptomPeriodStatistics
                .where((stat) => stat.symptom == selectedSymptom)
                .toList();

            // Create a new MensesStatistics object with the filtered symptomPeriodStatistics
            return MensesStatistics(
              symptomPeriodStatistics: filteredStatistics,
              periodsStats: element.periodsStats,
            );
          })
          .where((element) => element.symptomPeriodStatistics.isNotEmpty)
          .toList();
    }
    updatedMensesStatistics.value = resultList;
    updatedMensesStatistics.refresh();
  }
}
