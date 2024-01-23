import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/modules/calendar/calendar_store.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet_dialog.dart';

import '../../data/models/symptom_category.dart';

class SymptomCategoriesController extends GetxController {
  late CalendarStore calendarStore;

  //List of categories wich will change only when the saved button is pressed
  List<SymptomCategory> savedCategories = [];
  final RxBool _buttonShown = false.obs;

  //keep track of how many inHome categories there are
  int inHomeCategoriesCount = 0;
  final Function(bool) onSaveButtonValueChanged;

  SymptomCategoriesController({
    required this.onSaveButtonValueChanged,
  });

  @override
  void onInit() {
    calendarStore = Get.put(CalendarStore());
    //get initial values for currentInHomeCategories
    for (SymptomCategory category in calendarStore.currentCategories) {
      if (category.inHome) {
        inHomeCategoriesCount++;
      }
      savedCategories.add(SymptomCategory(
          categoryTitle: category.categoryTitle,
          categoryIconPath: category.categoryIconPath,
          inHome: category.inHome));
    }
    //fire a callback whenever the save button is supposed to be shown
    ever(_buttonShown, (newValue) => onSaveButtonValueChanged(newValue));
    super.onInit();
  }

  ///This method will handle the callback for when the inHome button is pressed
  void onValueChanged(
      String categoryTitle, bool newValue, int newCategoryIndex) {
    _buttonShown.value = false;
    calendarStore.currentCategories[newCategoryIndex].inHome = newValue;
    for (int i = 0; i < savedCategories.length; i++) {
      if (savedCategories[i].inHome !=
          calendarStore.currentCategories[i].inHome) {
        _buttonShown.value = true;
        break;
      }
    }
    if (newValue == true) {
      inHomeCategoriesCount++;
    } else {
      inHomeCategoriesCount--;
    }

    if (inHomeCategoriesCount > 3) {
      _handleMoreThenThreeCategoriesSelected(categoryTitle, newCategoryIndex);
    }
  }

  ///if there's more the 3 active in home categories show the dialog
  void _handleMoreThenThreeCategoriesSelected(
      String newCategoryTitle, int newCategoryIndex) {
    //ordered map to pass as an argument to the dialog (this way even inside the dialog categories will appear in the original order)

    SplayTreeMap<int, dynamic> orderedMap = SplayTreeMap(
      (key1, key2) => key1.compareTo(key2),
    );

    //put the previous active categories inside the map

    List<String> keys = [];
    for (SymptomCategory category in calendarStore.currentCategories) {
      keys.add(category.categoryTitle);
    }

    for (int i = 0; i < calendarStore.currentCategories.length; i++) {
      if (calendarStore.currentCategories[i].inHome == true) {
        orderedMap[i] = {
          'title': keys[i],
          'inHome': calendarStore.currentCategories[i].inHome
        };
      }
    }

    //put the new category inside the map

    orderedMap[newCategoryIndex] = {
      'title': newCategoryTitle,
      'inHome': false,
    };

    _showDialog(orderedMap);
  }

  void _showDialog(Map<int, dynamic> filteredMap) {
    showDialog(
      //disable outside tap
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) => CalendarBottomSheetDialog(
        filteredMap: filteredMap,
        onConfirmTap: (Map<int, dynamic> map) => onConfirmTap(map),
        onCancelTap: () {
          _revertChanges();
        },
      ),
    );
  }

  ///fired whenever the confirm button inside the dialog is pressed
  ///newInHomeCategories will contain non more then 3 inHome categories
  ///this method wil not save the categories but only update to new values, save button will still need to be pressed in order to save them (onSaved() method)
  void onConfirmTap(Map<int, dynamic> newInHomeCategories) {
    //reset the inHome categories count
    inHomeCategoriesCount = 0;
    //set the new values in currentCategories from the categories selected in dialog

    for (int key in newInHomeCategories.keys) {
      if (newInHomeCategories[key]['inHome'] == true) {
        inHomeCategoriesCount++;
      }

      calendarStore.currentCategories[key].inHome =
          newInHomeCategories[key]['inHome'];
    }
  }

  ///go back to last saved values
  void _revertChanges() {
    inHomeCategoriesCount = 0;
    for (int i = 0; i < savedCategories.length; i++) {
      if (savedCategories[i].inHome == true) {
        inHomeCategoriesCount++;
      }
      calendarStore.currentCategories[i].inHome = savedCategories[i].inHome;
    }

    _buttonShown.value = false;
  }

  ///save the new values
  void onSaved() {
    for (int i = 0; i < calendarStore.currentCategories.length; i++) {
      savedCategories[i].inHome = calendarStore.currentCategories[i].inHome;
    }
    //TODO: update local db
  }
}
