import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/data/log_levels.dart';
import 'package:lines/widgets/layouts/app_scaffold_controller.dart';

class BirthDateController extends AppScaffoldController {
  final Rx<TextEditingController> dayController = TextEditingController().obs;
  final Rx<TextEditingController> monthController = TextEditingController().obs;
  final Rx<TextEditingController> yearController = TextEditingController().obs;

  late FocusNode dayFocus = FocusNode();

  late FocusNode monthFocus = FocusNode();

  late FocusNode yearFocus = FocusNode();

  RxBool hasErrors = false.obs;
  RxString dayError = "".obs;
  RxString monthError = "".obs;

  @override
  void onInit() {
    super.onInit();

    dayController.value.addListener(() {
      if (dayController.value.text.length >= 2) {
        FocusScope.of(Get.context!).requestFocus(monthFocus);
      }
      ever(dayController, (_) => validateDay());

      handleFocusChange(dayController.value, dayFocus);
    });

    monthController.value.addListener(() {
      if (monthController.value.text.length >= 2) {
        FocusScope.of(Get.context!).requestFocus(yearFocus);
      }
      ever(monthController, (_) => validateMonth());

      handleFocusChange(monthController.value, monthFocus);
    });

    yearController.value.addListener(() {
      if (yearController.value.text.length >= 4) {
        FocusScope.of(Get.context!).unfocus();
      }
    });
  }

  void clearAll() {
    FocusScope.of(Get.context!).unfocus();

    dayController.value.clear();
    monthController.value.clear();
    yearController.value.clear();
  }

  @override
  void dispose() {
    dayController.value.dispose();
    monthController.value.dispose();
    yearController.value.dispose();

    dayFocus.dispose();
    monthFocus.dispose();
    yearFocus.dispose();

    super.dispose();
  }

  void handleFocusChange(
      TextEditingController controller, FocusNode focusNode) {
    if (controller.text.length == 1 && !focusNode.hasPrimaryFocus) {
      controller.text = "0${controller.text}";
    }
  }

  void validateDay() {
    int? day = int.tryParse(dayController.value.text);

    if (day == null || day > 31) {
      dayError.value = "Giorno non valido";
    }
  }

  void validateMonth() {
    int? month = int.tryParse(monthController.value.text);

    if (month == null || month > 12) {
      monthError.value = "Mese non valido";
    }
  }
}
