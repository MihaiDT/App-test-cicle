import 'symptom.dart';

class SymptomCategory {
  final String categoryTitle;
  final List<Symptom> symptoms = [];
  final String categoryIconPath;

  SymptomCategory(
      {required this.categoryTitle, required this.categoryIconPath});

  addSymptom(Symptom newSymptom) {
    symptoms.add(newSymptom);
  }

  @override
  String toString() {
    return 'SymptomCategory{categoryTitle: $categoryTitle, symptoms: $symptoms}';
  }
}
