import 'package:get/get.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/symptom.dart';
import 'package:lines/data/models/symptom_category.dart';
import 'package:lines/routes/routes.dart';

import 'package:lines/modules/calendar/calendar_store.dart';

class SymptomsController extends GetxController {
  late CalendarStore calendarStore;

  // This list stores the symptoms that the user has saved for a particular date.
  //It can be empty depending on the value it gets from the local db
  final RxList<Symptom> savedSymptoms = <Symptom>[].obs;

  List<SymptomCategory> get currentCategories =>
      calendarStore.currentCategories;

  //whether or not the bottom save button must appear
  bool _buttonShown = false;

  //called when the _buttonShown value changes
  final Function(bool) onSaveButtonValueChanged;

  SymptomsController({
    required this.onSaveButtonValueChanged,
  });

  @override
  void onInit() {
    super.onInit();
    calendarStore = Get.put(CalendarStore());
    _fillSavedSymptoms();
    _listenForDateChanges();
  }

  void _listenForDateChanges() {
    ever(
      calendarStore.rxSelectedDate,
      condition: () => Get.currentRoute == Routes.calendar,
      (callback) {
        _getNewSelectedSymptomsIntoSavedSymptoms();
      },
    );
  }

  ///fill savedSymptoms with selectedSymptoms( initially selectedSymptoms will have the same selected symptoms in the local db)
  void _fillSavedSymptoms() {
    _getNewSelectedSymptomsIntoSavedSymptoms();
  }

  ///overwrite savedSymptoms list with a new list of selectedSymptoms
  void _getNewSelectedSymptomsIntoSavedSymptoms() {
    savedSymptoms.clear();
    savedSymptoms.addAll(selectedSymptoms);
  }

  ///returns a list of symptoms where each symptom has selected attribute set to true
  List<Symptom> get selectedSymptoms {
    List<Symptom> list = currentCategories
        .expand(
          (element) =>
              element.symptoms.where((element) => element.selected == true),
        )
        .toList();
    return list;
  }

  ///change selected value for the symptom of a particular category
  void changeSelectedValue(int categoryIndex, int symptomIndex) {
    if (categoryIndex == 0) {
      handlePeriodCategory(symptomIndex);
    } else {
      currentCategories[categoryIndex].symptoms[symptomIndex].selected =
          !currentCategories[categoryIndex].symptoms[symptomIndex].selected;
    }
    _onSymptomChanged();
  }

  ///Period category doesn't have a multi selection for it's symptom so it has to be handled differently
  void handlePeriodCategory(int symptomIndex) {
    const int periodCategoryIndex = 0;
    if (currentCategories[periodCategoryIndex]
        .symptoms[symptomIndex]
        .selected) {
      currentCategories[periodCategoryIndex].symptoms[symptomIndex].selected =
          false;
    } else {
      for (Symptom symptom in currentCategories[periodCategoryIndex].symptoms) {
        symptom.selected = false;
      }
      currentCategories[periodCategoryIndex].symptoms[symptomIndex].selected =
          true;
    }
  }

  ///Check if any symptoms has been selected or deselected by comparing savedSymptoms to selectedSymptoms lists,
  ///if there are some changes set _buttonShown to true to trigger the visibility if bottom save button
  void _onSymptomChanged() {
    _changeButtonValue(true);
    if (savedSymptoms.length == selectedSymptoms.length) {
      for (int i = 0; i < savedSymptoms.length; i++) {
        if (selectedSymptoms[i] != savedSymptoms[i]) {
          return;
        }
      }
      _changeButtonValue(false);
    }
  }

  ///Only save data for symptoms
  void saveSymptoms() {
    _getNewSelectedSymptomsIntoSavedSymptoms();
    _changeButtonValue(false);
    _updateSymptomsList(savedSymptoms);
    _saveSymptomsInDB(savedSymptoms);
  }

  ///fire the callback everytime _buttonShown value changes
  void _changeButtonValue(bool newValue) {
    _buttonShown = newValue;
    onSaveButtonValueChanged(_buttonShown);
  }

  void _saveSymptomsInDB(List<Symptom> selectedSymptoms) {
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

  void _updateSymptomsList(List<Symptom> selectedSymptoms) {
    if (calendarStore.selectedDate != null) {
      appController.calendarDayViewModel.value?.updateSymptomList(
        calendarStore.selectedDate!,
        selectedSymptoms,
      );
    }
  }

  DateTime _normalizeDate(DateTime dateTime) {
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
    );
  }
}
