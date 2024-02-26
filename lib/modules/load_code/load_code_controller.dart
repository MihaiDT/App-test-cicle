import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/utils/singletons.dart';

class LoadCodeController extends GetxController {
  int get totalCoins => appController.user.value?.coinsCollected ?? 0;
  final TextEditingController codeController = TextEditingController();
  final FocusNode codeFocusNode = FocusNode();
  final RxList writtenCode = List<String>.filled(10, "").obs;

  @override
  void onReady() {
    super.onReady();
    openKeyboard();
  }

  void openKeyboard() {
    codeFocusNode.requestFocus();
  }

  void updateWrittenCode(String newValue) {
    String oldValue = writtenCode.join("");
    if (newValue.length < oldValue.length) {
      int index = newValue.length;
      writtenCode[index] = "";
    } else {
      List<String> values = newValue.split("");
      for (int i = 0; i < values.length; i++) {
        writtenCode[i] = values[i];
      }
    }
  }
}
