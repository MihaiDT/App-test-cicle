import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CodeTextFieldController extends GetxController {
  final TextEditingController codeController = TextEditingController();
  final FocusNode codeFocusNode = FocusNode();
  final RxList writtenCode = List<String>.filled(10, "").obs;

  @override
  void onReady() {
    super.onReady();
    openKeyboard();
  }

  @override
  void dispose() {
    super.dispose();
    codeController.dispose();
    codeFocusNode.dispose();
  }

  void openKeyboard() {
    codeFocusNode.requestFocus();
  }

  void updateWrittenCode(String newValue) {
    if (newValue.length == 10) {
      codeFocusNode.unfocus();
    }
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
