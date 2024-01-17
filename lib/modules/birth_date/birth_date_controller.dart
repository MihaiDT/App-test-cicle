import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/birth_date/widget/too_young_error_dialog.dart';
import 'package:lines/routes/routes.dart';
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

  RxString dayValue = "".obs;
  RxString monthValue = "".obs;
  RxString yearValue = "".obs;

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
        FocusManager.instance.primaryFocus?.unfocus();
      }
      ever(yearController, (_) => validateYear());
    });
  }

  @override
  void dispose() {
    clearAll();

    dayFocus.dispose();
    monthFocus.dispose();
    yearFocus.dispose();

    super.dispose();
  }

  void clearAll() {
    FocusScope.of(Get.context!).unfocus();

    dayController.value.clear();
    monthController.value.clear();
    yearController.value.clear();
  }

  void handleFocusChange(
    TextEditingController controller,
    FocusNode focusNode,
  ) {
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

  void validateYear() {
    int? year = int.tryParse(yearController.value.text);

    if (year == null || year > DateTime.now().year - 100) {
      monthError.value = "Anno non valido";
    }
  }

  void checkBirthDate(
    String day,
    String month,
    String year,
    BuildContext context,
  ) {
    _closeKeyboard;
    if (!_hasMoreThan13Years(day, month, year)) {
      _showError(context);
    } else if (checkError) {
      hasErrors.value = true;
    } else {
      _saveBirthDate(day, month, year);
      Get.toNamed(Routes.privacy);
    }
  }

  /// Used to avoid overflow bug if AlertDialog is open
  void get _closeKeyboard {
    if (Platform.isAndroid) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }

  /// Calculate the age and check if the user has 14 year or more
  bool _hasMoreThan13Years(
    String day,
    String month,
    String year,
  ) {
    DateTime now = DateTime.now();

    // Calculate the current date
    DateTime userBirthday = DateTime(
      int.parse(year),
      int.parse(month),
      int.parse(day),
    );

    // Calculate the age difference
    int age = now.year - userBirthday.year;

    // Check if the user has already had their birthday this year or will have it later
    if (now.month < userBirthday.month ||
        (now.month == userBirthday.month && now.day < userBirthday.day)) {
      age--;
    }

    // Check if the user is above 14 years old
    return age > 14;
  }

  bool get checkError {
    int writtenValue = int.parse(dayValue.value);
    if (writtenValue < 0 || writtenValue > 31) {
      return true;
    }

    return false;
  }

  void _showError(BuildContext context) {
    showErrorDialog(
      context: context,
      builder: (_) {
        return const TooYoungErrorDialog();
      },
    );
  }

  /// Save birth date in App state
  void _saveBirthDate(String day, String month, String year) {
    appController.registerParameter.birthdate = "$year-$month-$day";
  }

  bool get canProceed {
    return dayValue.value.isNotEmpty &&
        monthValue.value.isNotEmpty &&
        yearValue.value.isNotEmpty;
  }
}
