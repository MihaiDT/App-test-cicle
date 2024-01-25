import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/symptom.dart';
import 'calendar_store.dart';

class SymptomsController extends GetxController {
  VoidCallback? onSymptomChanged;
  RxList<Symptom> rxSavedSymptoms = <Symptom>[].obs;
  late CalendarStore calendarStore;

  SymptomsController({this.onSymptomChanged}) {
    calendarStore = Get.put(CalendarStore());
    rxSavedSymptoms.addAll(getActiveSymptoms);
    ever(
      calendarStore.rxSelectedDate,
      (callback) {
        onSelectedDateChanged();
      },
    );
  }

  void onSelectedDateChanged() {
    rxSavedSymptoms.clear();
    rxSavedSymptoms.addAll(getActiveSymptoms);
  }

  List<Symptom> get getActiveSymptoms {
    List<Symptom> list = calendarStore.currentCategories
        .expand((element) =>
            element.symptoms.where((element) => element.selected == true))
        .toList();
    return list;
  }

  ///change selected value for the symptom of a particular category
  void changeSelectedValue(int categoryIndex, int symptomIndex) {
    if (categoryIndex == 0) {
      for (Symptom symptom
          in calendarStore.currentCategories[categoryIndex].symptoms) {
        symptom.selected = false;
      }
    }
    calendarStore
            .currentCategories[categoryIndex].symptoms[symptomIndex].selected =
        !calendarStore
            .currentCategories[categoryIndex].symptoms[symptomIndex].selected;

    if (onSymptomChanged != null) {
      onSymptomChanged!();
    }
    //TODO: save new value in db
  }
}
