import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class NameSurnameController extends GetxController {
  late final TextEditingController nameController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
    if (appController.registerParameter.firstName.isNotEmpty == true) {
      nameController.text = appController.registerParameter.firstName;
    }
  }

  final TextEditingController surnameController = TextEditingController();

  final TextEditingController nicknameController = TextEditingController();

  RxString nameValue = "".obs;
  RxString surnameValue = "".obs;

  bool get canProceed =>
      nameValue.value.isNotEmpty && surnameValue.value.isNotEmpty;
}
