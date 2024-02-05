import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:lines/data/models/symptom_category.dart';

class Symptom {
  final String symptomName;
  final int indexInSymptomCategory;
  final SymptomCategory category;
  final RxBool rxSelected = false.obs;

  bool get selected => rxSelected.value;

  set selected(bool newValue) {
    rxSelected.value = newValue;
  }

  final String? iconPath;

  Symptom({
    required this.category,
    required this.symptomName,
    required this.indexInSymptomCategory,
    this.iconPath,
  });

  @override
  String toString() {
    return 'Symptom{symptomName: $symptomName, selected: $rxSelected}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Symptom &&
          runtimeType == other.runtimeType &&
          symptomName == other.symptomName &&
          rxSelected.value == other.rxSelected.value &&
          iconPath == other.iconPath;

  @override
  int get hashCode =>
      symptomName.hashCode ^ rxSelected.hashCode ^ iconPath.hashCode;
}
