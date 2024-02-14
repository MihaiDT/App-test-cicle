import 'package:get/get.dart';

class YourInterestsSectionController extends GetxController {
  final List<String> interests = [
    "Educazione sessuale",
    "Sport e fitness",
    "Visita dalla ginecologa",
    "Gravidanza",
    "Benessere mentale",
    "Make-up",
    "Alimentazione",
    "Moda e lifestyle",
    "Skincare e dermatologia",
    "La prima volta",
    "Contraccezione",
    "Domande imbarazzanti",
  ];
  final selectedInterests = <String>[].obs;

  void toggleInterest(String interest) {
    if (selectedInterests.contains(interest)) {
      selectedInterests.remove(interest);
    } else {
      selectedInterests.add(interest);
    }
  }
}
