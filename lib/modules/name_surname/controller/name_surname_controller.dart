import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class NameSurnameController extends GetxController {
  late final TextEditingController nameController = TextEditingController();

  final TextEditingController surnameController = TextEditingController();

  final TextEditingController nicknameController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode surnameFocusNode = FocusNode();
  final FocusNode nicknameFocusNode = FocusNode();

  @override
  void onReady() {
    super.onReady();
    if (appController.registerParameter.firstName.isNotEmpty == true) {
      nameController.text = appController.registerParameter.firstName;
    }
  }

  RxString nameValue = "".obs;
  RxString surnameValue = "".obs;

  bool get canProceed =>
      nameValue.value.isNotEmpty && surnameValue.value.isNotEmpty;

  @override
  void onClose() {
    nameController.dispose();
    surnameController.dispose();
    nicknameController.dispose();
    nameFocusNode.dispose();
    surnameFocusNode.dispose();
    nicknameFocusNode.dispose();
    super.onClose();
  }
}
