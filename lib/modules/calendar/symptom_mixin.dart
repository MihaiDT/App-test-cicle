// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/isar/symptom.dart';
import 'package:lines/data/isar/symptom_calendar.dart';

mixin SymptomsMixin {
  RxList<Symptom> rxSavedSymptoms = RxList<Symptom>.from({});
  RxList<Symptom> rxCurrentSymptoms = RxList<Symptom>.from({});

  /// Show the save button because some symptoms have been selected/deselected
  bool get showSaveButtonSymptoms {
    final Set<Symptom> savedSymptomsSet = Set.of(rxSavedSymptoms.value);
    final Set<Symptom> currentSymptomsSet = Set.of(rxCurrentSymptoms.value);
    return savedSymptomsSet.difference(currentSymptomsSet).isNotEmpty ||
        currentSymptomsSet.difference(savedSymptomsSet).isNotEmpty;
  }

  void initSymptoms({required String date}) {
    fillSavedSymptoms(date);
  }

  void fillSavedSymptoms(String date) {
    rxSavedSymptoms.value.clear();
    rxCurrentSymptoms.value.clear();

    SymptomCalendar? symptomCalendar =
        (appController.symptomsCalendar.value as RxMap<String, SymptomCalendar>)
            .value[date];

    if (symptomCalendar != null) {
      rxSavedSymptoms.value.addAll(symptomCalendar.symptoms.toList());
      rxCurrentSymptoms.value.addAll(symptomCalendar.symptoms.toList());
    }

    rxSavedSymptoms.refresh();
    rxCurrentSymptoms.refresh();
  }

  ///change selected value for the symptom of a particular category
  void changeSelectedSymptom({required Symptom symptom}) {
    final isPresent = rxCurrentSymptoms.value
        .where(
          (item) => item.id == symptom.id,
        )
        .toList()
        .isNotEmpty;

    if (symptom.category.value!.id == 1) {
      resetPeriodCategory();
    }

    if (isPresent) {
      rxCurrentSymptoms.value.removeWhere(
        (item) => item.id == symptom.id,
      );
    } else {
      rxCurrentSymptoms.value.add(symptom);
    }

    rxCurrentSymptoms.refresh();
  }

  /// Period category doesn't have a multi selection for it's symptom so it has to be handled differently
  void resetPeriodCategory() {
    final List<Symptom> tmpCurrentSymptoms = [];

    for (Symptom symptom in rxCurrentSymptoms.value) {
      if (symptom.category.value!.id != 1) {
        tmpCurrentSymptoms.add(symptom);
      }
    }

    rxCurrentSymptoms.value = tmpCurrentSymptoms;
  }
}
