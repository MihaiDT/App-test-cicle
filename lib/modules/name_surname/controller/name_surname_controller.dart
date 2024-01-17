import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NameSurnameController extends GetxController {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController surnameController = TextEditingController();

  final TextEditingController nicknameController = TextEditingController();

  RxString nameValue = "".obs;
  RxString surnameValue = "".obs;

  bool get canProceed =>
      nameValue.value.isNotEmpty && surnameValue.value.isNotEmpty;
}
