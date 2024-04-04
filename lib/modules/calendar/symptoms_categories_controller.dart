import 'package:get/get.dart';
import 'package:lines/data/isar/symptom_category.dart';

class SymptomCategoriesController extends GetxController {
  // late CalendarStore calendarStore;

  //List of categories wich will change only when the saved button is pressed
  late final RxList<SymptomCategory> symptomCategories =
      RxList<SymptomCategory>();
  final RxBool _buttonShown = false.obs;

  //keep track of how many inHome categories there are
  int inHomeCategoriesCount = 0;

  @override
  void onInit() {
    symptomCategories.addAll(SymptomCategory.findAll());
    // fire a callback whenever the save button is supposed to be shown
    super.onInit();
  }

  ///This method will handle the callback for when the inHome button is pressed
  void onValueChanged(
    String categoryTitle,
    bool newValue,
    int newCategoryIndex,
  ) {
    // _buttonShown.value = false;

    // calendarStore.currentCategories[newCategoryIndex].inHome = newValue;
    // for (int i = 0; i < symptomCategories.length; i++) {
    //   if (symptomCategories[i].inHome != calendarStore.currentCategories[i].inHome) {
    //     _buttonShown.value = true;
    //     break;
    //   }
    // }
    // if (newValue == true) {
    //   inHomeCategoriesCount++;
    // } else {
    //   inHomeCategoriesCount--;
    // }

    // if (inHomeCategoriesCount > 3) {
    //   _handleMoreThenThreeCategoriesSelected(categoryTitle, newCategoryIndex);
    // }
  }

  ///if there's more the 3 active in home categories show the dialog
  void _handleMoreThenThreeCategoriesSelected(
    String newCategoryTitle,
    int newCategoryIndex,
  ) {
    //ordered map to pass as an argument to the dialog (this way even inside the dialog categories will appear in the original order)

    // SplayTreeMap<int, dynamic> orderedMap = SplayTreeMap(
    //   (key1, key2) => key1.compareTo(key2),
    // );

    // //put the previous active categories inside the map

    // List<String> keys = [];
    // for (SymptomCategory category in calendarStore.currentCategories) {
    //   keys.add(category.categoryTitle);
    // }

    // for (int i = 0; i < calendarStore.currentCategories.length; i++) {
    //   if (calendarStore.currentCategories[i].inHome == true) {
    //     orderedMap[i] = {'title': keys[i], 'inHome': calendarStore.currentCategories[i].inHome};
    //   }
    // }

    // //put the new category inside the map

    // orderedMap[newCategoryIndex] = {
    //   'title': newCategoryTitle,
    //   'inHome': false,
    // };

    // _showDialog(orderedMap);
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

      // calendarStore.currentCategories[key].inHome = newInHomeCategories[key]['inHome'];
    }
  }

  ///go back to last saved values
  void _revertChanges() {
    inHomeCategoriesCount = 0;
    for (int i = 0; i < symptomCategories.length; i++) {
      if (symptomCategories[i].inHome == true) {
        inHomeCategoriesCount++;
      }
      // calendarStore.currentCategories[i].inHome = symptomCategories[i].inHome;
    }

    _buttonShown.value = false;
  }

  ///save the new values
  void onSaved() {
    // for (int i = 0; i < calendarStore.currentCategories.length; i++) {
    //   symptomCategories[i].inHome = calendarStore.currentCategories[i].inHome;
    // }
    //TODO: update local db
  }
}
