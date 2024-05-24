import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/adjust_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/birth_date/widget/too_young_error_dialog.dart';
import 'package:lines/modules/privacy/privacy_arguments.dart';
import 'package:lines/modules/tutor_email/tutor_email_arguments.dart';
import 'package:lines/routes/routes.dart';

class BirthDateController extends GetxController {
  final Rx<TextEditingController> dayController = TextEditingController().obs;
  final Rx<TextEditingController> monthController = TextEditingController().obs;
  final Rx<TextEditingController> yearController = TextEditingController().obs;

  late FocusNode dayFocus = FocusNode();

  late FocusNode monthFocus = FocusNode();

  late FocusNode yearFocus = FocusNode();

  RxString dayError = "".obs;
  RxString monthError = "".obs;
  RxString yearError = "".obs;

  RxSet<RxString> errorList = <RxString>{}.obs;
  RxString dayValue = "".obs;
  RxString monthValue = "".obs;
  RxString yearValue = "".obs;

  @override
  void onInit() {
    super.onInit();
    dayController.value.addListener(() {
      if (dayController.value.text.length >= 2) {
        validateDay();
        FocusScope.of(Get.context!).requestFocus(monthFocus);
      }
    });

    monthController.value.addListener(() {
      if (monthController.value.text.length >= 2) {
        validateMonth();
        FocusScope.of(Get.context!).requestFocus(yearFocus);
      }
    });

    yearController.value.addListener(() {
      if (yearController.value.text.length >= 4) {
        validateYear();
        FocusScope.of(Get.context!).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      }
    });
  }

  @override
  void onClose() {
    clearAll();
    super.onClose();
  }

  void clearAll() {
    FocusScope.of(Get.context!).unfocus();

    dayController.value.clear();
    monthController.value.clear();
    yearController.value.clear();
    dayFocus.dispose();
    monthFocus.dispose();
    yearFocus.dispose();
  }

  void validateDay() {
    int? day = int.tryParse(dayController.value.text);
    errorList.remove(dayError);
    if (day == null || day > 31) {
      dayError.value = "Giorno non valido";
      errorList.add(dayError);
    }
  }

  void validateMonth() {
    int? month = int.tryParse(monthController.value.text);
    errorList.remove(monthError);

    if (month == null || month > 12) {
      monthError.value = "Mese non valido";
      errorList.add(monthError);
    }
  }

  void validateYear() {
    int? year = int.tryParse(yearController.value.text);
    errorList.remove(yearError);

    if (year == null || year < DateTime.now().year - 100) {
      yearError.value = "Anno non valido";
      errorList.add(yearError);
    }
  }

  void checkBirthDate(
    String day,
    String month,
    String year,
    BuildContext context,
  ) {
    _closeKeyboard;
    _saveBirthDate(day, month, year);

    AdjustManager.trackEvent(EventType.birthDate, {
      "birthdate": "$year-$month-$day",
    });

    if (_isLessThan14Years(day, month, year)) {
      _showError(context);
    } else if (_isAgeBetween13And18(day, month, year)) {
      Get.toNamed(
        Routes.tutorEmailPage,
        arguments: TutorEmailArguments(
          onContinue: (_) {
            Get.offAndToNamed(
              Routes.privacy,
              arguments: PrivacyArguments(
                userIsAdult: false,
              ),
            );
          },
        ),
      );
    } else {
      Get.toNamed(
        Routes.privacy,
        arguments: PrivacyArguments(
          userIsAdult: true,
        ),
      );
    }
  }

  /// Used to avoid overflow bug if AlertDialog is open
  void get _closeKeyboard {
    if (Platform.isAndroid) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
  }

  /// Calculate the age and check if the user is less than 14 years old
  bool _isLessThan14Years(
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

    // Check if the user is less than 14 years old
    return age < 14;
  }

  bool _isAgeBetween13And18(String day, String month, String year) {
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

    // Check if the user is between 13 and 18 years old
    return age >= 13 && age < 18;
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
