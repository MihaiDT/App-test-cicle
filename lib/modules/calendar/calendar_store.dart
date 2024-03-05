import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/symptom.dart';

import 'package:lines/data/models/symptom_category.dart';

class CalendarStore extends GetxController {
  final Rxn<DateTime> rxSelectedDate = Rxn();

  DateTime? get selectedDate => rxSelectedDate.value;

  set selectedDate(DateTime? newDate) {
    rxSelectedDate.value = newDate;
  }

  final RxList<SymptomCategory> rxCurrentCategories = <SymptomCategory>[].obs;

  List<SymptomCategory> get currentCategories => rxCurrentCategories;

  set currentCategories(List<SymptomCategory> newCategories) {
    //beeing a RxList type we need to change the value inside the actual list and not change its reference with a new one, in order to update correctly its state
    rxCurrentCategories.clear();
    rxCurrentCategories.addAll(newCategories);
  }

  @override
  void onInit() {
    super.onInit();
    selectedDate = DateTime.now();
    if (selectedDate != null) {
      currentCategories = _getSymptomCategoriesForDay(selectedDate!);
      ever(
        rxSelectedDate,
        (newSelectedDate) {
          currentCategories = _getSymptomCategoriesForDay(newSelectedDate!);
        },
      );
    }
  }

  //return a list of categories for the day where the selected value of each symptom can be either true or false
  List<SymptomCategory> _getSymptomCategoriesForDay(DateTime day) {
    List<Symptom>? symptom =
        appController.calendarDayViewModel.value?.getSymptomsForDay(day);
    final newList = SymptomCategory.newList;
    symptom?.forEach((symptom) {
      newList
          .firstWhereOrNull(
            (symptomCategory) => symptomCategory == symptom.category,
          )
          ?.symptoms[symptom.indexInSymptomCategory]
          .selected = true;
    });

    return newList;
  }
}
