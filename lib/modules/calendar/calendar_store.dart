import 'package:get/get.dart';

import '../../data/models/symptom_category.dart';

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

  //return a list of categories for the day where the selected value of each symptom can be either true or false
  List<SymptomCategory> _getSymptomCategoriesForDay(DateTime? day) {
    //TODO: read from localdb the saved symptoms
    //test values , do not use in later implementation
    Map<int, dynamic> x = {
      // 0: [2],
      // 1: [0, 3]
      0: {
        'inHome': true,
        'selectedSymptoms': [2]
      },
      1: {
        'inHome': true,
        'selectedSymptoms': [0, 3]
      }
    };
    List<SymptomCategory> newList = SymptomCategory.newList;

    for (int key in x.keys) {
      newList[key].inHome = x[key]['inHome'];
      for (int symptom in x[key]['selectedSymptoms']!) {
        newList[key].symptoms[symptom].selected = true;
      }
    }

    return newList;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedDate = DateTime.now();
    currentCategories = _getSymptomCategoriesForDay(selectedDate);
    ever(
      rxSelectedDate,
      (newSelectedDate) {
        currentCategories = _getSymptomCategoriesForDay(newSelectedDate);
      },
    );
  }
}
