import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/menses_statistics.dart';
import 'package:lines/data/models/symptom.dart';
import 'package:lines/modules/charts_and_statistics/widgets/filter_symptoms_bottomsheet.dart';

class ChartsAndStatisticsController extends GetxController {
  RxList<MensesStatistics> mensesStatistics = <MensesStatistics>[].obs;
  Rx<Symptom?>? selectedSymptom;

  @override
  void onInit() {
    selectedSymptom = Rx<Symptom?>(null);

    List<MensesStatistics> savedMensesStatistics =
        appController.mensesStatistics.value ?? [];
    mensesStatistics = savedMensesStatistics.obs;
    super.onInit();
  }

  /// If null means that all symptoms are selected
  List<Symptom> get filterSymptom {
    List<Symptom> symptoms = [];
    for (int i = 0; i < mensesStatistics.length; i++) {
      for (int j = 0;
          j < mensesStatistics[i].symptomPeriodStatistics.length;
          j++) {
        symptoms.add(mensesStatistics()[i].symptomPeriodStatistics[j].symptom);
      }
    }

    return symptoms.toSet().toList();
  }

  Future<void> onFilterSectionTapped({
    required List<Symptom> filterSymptoms,
  }) async {
    final Symptom? symptom = await Get.bottomSheet(
      FilterSymptomsBottomSheet(
        symptoms: filterSymptoms,
        selectedSymptom: selectedSymptom?.value,
      ),
    ).then((value) {
      return value;
    });
    selectedSymptom?.value = symptom;

    mensesStatistics.clear();
    mensesStatistics.value = updateMensesStatistics(selectedSymptom?.value);
  }

  List<MensesStatistics> updateMensesStatistics(Symptom? selectedSymptom) {
    List<MensesStatistics> savedMensesStatistics = [];
    savedMensesStatistics.addAll(appController.mensesStatistics.value ?? []);
    if (selectedSymptom == null) {
      return savedMensesStatistics;
    } else {
      final resultList = savedMensesStatistics
          .where(
            (element) => element.symptomPeriodStatistics
                .any((element) => element.symptom == selectedSymptom),
          )
          .toList();

      for (var element in resultList) {
        element.symptomPeriodStatistics.removeWhere(
          (element) => element.symptom != selectedSymptom,
        );
      }

      mensesStatistics.value = resultList;
      return resultList;
    }
  }
}
