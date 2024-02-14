import 'package:get/get.dart';
import 'package:lines/data/models/symptom.dart';
import 'package:lines/data/models/symptom_category.dart';

class YourDiarySectionController extends GetxController {
  // todo: implement with the correct symptoms
  List<Symptom> get mostFrequentSymptoms => [
        Symptom(
          category: SymptomCategory.livelloDiStressCategory,
          symptomName: "Crampi",
          indexInSymptomCategory: 0,
          iconPath: "assets/icons/sintomi/crampi.svg",
        ),
        Symptom(
          category: SymptomCategory.livelloDiStressCategory,
          symptomName: "Mal di schiena",
          indexInSymptomCategory: 0,
          iconPath: "assets/icons/sintomi/mal_di_schiena.svg",
        ),
        Symptom(
          category: SymptomCategory.livelloDiStressCategory,
          symptomName: "Tensione al seno",
          indexInSymptomCategory: 0,
          iconPath: "assets/icons/sintomi/tensione_al_seno.svg",
        ),
        Symptom(
          category: SymptomCategory.livelloDiStressCategory,
          symptomName: "Gonfiore",
          indexInSymptomCategory: 0,
          iconPath: "assets/icons/sintomi/gonfiore.svg",
        ),
      ];

  List<SymptomCategory> get symptomCategories => SymptomCategory.newList;
}
