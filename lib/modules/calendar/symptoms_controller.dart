import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/symptom.dart';

import 'calendar_store.dart';

class SymptomsController extends GetxController {
  VoidCallback? onSymptomChanged;
  RxList<Symptom> rxSavedSymptoms = <Symptom>[].obs;
  late CalendarStore calendarStore;

  SymptomsController({
    this.onSymptomChanged,
  });

  @override
  void onInit() {
    super.onInit();
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

  void saveSymptomsInDB(List<Symptom> selectedSymptoms) {
    if (calendarStore.selectedDate != null) {
      final DateTime actualDate = _normalizeDate(calendarStore.selectedDate!);

      /// Get the saved symptoms in the db
      Map<DateTime, List<Symptom>> savedSymptoms = HiveManager.savedSymptoms;

      /// Update a local map
      savedSymptoms[actualDate] = selectedSymptoms;

      /// Save the updated map in the db
      HiveManager.savedSymptoms = savedSymptoms;
    }
  }

  void updateSymptomsList(List<Symptom> selectedSymptoms) {
    if (calendarStore.selectedDate != null) {
      appController.calendarDayViewModel.value?.updateSymptomList(
        calendarStore.selectedDate!,
        selectedSymptoms,
      );
    }
  }

  DateTime _normalizeDate(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month, dateTime.day);
  }
}
