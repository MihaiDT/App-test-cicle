// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/data/isar/symptom.dart';
import 'package:lines/data/isar/symptom_category.dart';
import 'package:lines/data/models/period_symptom.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/routes/routes.dart';

class SymptomsController extends GetxController {
  late List<Symptom> savedSymptoms;

  RxList<Symptom> rxCurrentSymptoms = RxList<Symptom>.empty();
  List<Symptom> get currentSymptoms => rxCurrentSymptoms.value;
  set currentSymptoms(List<Symptom> newValue) =>
      rxCurrentSymptoms.value = newValue;

  final CalendarController calendarController = Get.find<CalendarController>();

  Set<int> get currentSymptomIds {
    return currentSymptoms.map((item) => item.id).toSet();
  }

  Set<int> get savedSymptomIds => savedSymptoms.map((item) => item.id).toSet();

  List<SymptomCategory> get currentCategories => SymptomCategory.findAll();

  //whether or not the bottom save button must appear
  bool get buttonShown =>
      savedSymptomIds.containsAll(currentSymptomIds) &&
      currentSymptomIds.containsAll(savedSymptomIds);

  //called when the _buttonShown value changes
  final Function(bool) onSaveButtonValueChanged;

  SymptomsController({
    required this.onSaveButtonValueChanged,
  });

  @override
  void onInit() {
    super.onInit();
    // calendarStore = Get.put(CalendarStore());
    _fillSavedSymptoms();
    _listenForDateChanges();
  }

  void _listenForDateChanges() {
    ever(
      calendarController.rxSelectedDate,
      condition: () => Get.currentRoute == Routes.calendar,
      (callback) {
        _getNewSelectedSymptomsIntoSavedSymptoms();
      },
    );
  }

  PeriodSymptom? getDTOForDay(String date) => null;

  ///fill rxSymptoms with selectedSymptoms( initially selectedSymptoms will have the same selected symptoms in the local db)
  void _fillSavedSymptoms() {
    _getNewSelectedSymptomsIntoSavedSymptoms();
  }

  ///overwrite rxSymptoms list with a new list of selectedSymptoms
  void _getNewSelectedSymptomsIntoSavedSymptoms() {
    String date = dateFormatYMD.format(calendarController.rxSelectedDate.value);
    // final symptomCalendar = getDTOForDay(date)?.symptomCalendar;

    // savedSymptoms = symptomCalendar?.symptoms.toList() ?? [];
    // currentSymptoms = savedSymptoms;
    // rxCurrentSymptoms.refresh();

    // print("Sintomi: ${getDTOForDay(date)?.symptomCalendar?.symptoms.toList()}");
  }

  ///change selected value for the symptom of a particular category
  void changeSelectedValue({required Symptom symptom}) {
    if (symptom.category.value!.id == 1) {
      resetPeriodCategory();
    }

    if (currentSymptoms.map((item) => item.id).contains(symptom.id)) {
      currentSymptoms.removeWhere((item) => item.id == symptom.id);
    } else {
      currentSymptoms.add(symptom);
    }

    rxCurrentSymptoms.refresh();
  }

  /// Period category doesn't have a multi selection for it's symptom so it has to be handled differently
  void resetPeriodCategory() {
    for (Symptom symptom in currentSymptoms) {
      final symptomId = symptom.category.value!.id;
      if (symptom.category.value!.id == 1) {
        currentSymptoms.removeWhere((item) => item.id == symptomId);
        rxCurrentSymptoms.refresh();
      }
    }
  }

  ///Only save data for symptoms
  void saveSymptoms() {
    _getNewSelectedSymptomsIntoSavedSymptoms();

// FIXME:
    // _updateSymptomsList(rxSymptoms);
    // _saveSymptomsInDB(rxSymptoms);
  }

  void _saveSymptomsInDB(List<Symptom> symptoms) {
    final DateTime selectedDate =
        _normalizeDate(calendarController.rxSelectedDate.value);

    /// Get the saved symptoms in the db
    // FIXME: Flower Map<DateTime, List<Symptom>> rxSymptoms = HiveManager.rxSymptoms;

    /// Update a local map
    // FIXME: Flower rxSymptoms[actualDate] = symptoms;

    /// Save the updated map in the db
    // FIXME: Flower Save on Isar HiveManager.rxSymptoms = rxSymptoms;
  }

  // void _updateSymptomsList(List<Symptom> symptoms) {
  //   appController.calendarDays.value?.updateSymptomList(
  //     calendarController.rxSelectedDate.value,
  //     symptoms,
  //   );
  // }

  DateTime _normalizeDate(DateTime dateTime) {
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
    );
  }
}
