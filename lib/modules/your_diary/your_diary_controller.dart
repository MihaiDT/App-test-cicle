import 'package:get/get.dart';
import 'package:lines/data/models/symptom_category.dart';

class YourDiaryController extends GetxController {
  List<SymptomCategory> get list => SymptomCategory.newList;
}
