import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/forms/controllers/code_textfield_controller.dart';

class CodeTextfield extends StatefulWidget {
  final Function(String text) onChanged;

  const CodeTextfield({
    required this.onChanged,
    super.key,
  });

  @override
  State<CodeTextfield> createState() => _CodeTextfieldState();
}

class _CodeTextfieldState extends State<CodeTextfield> {
  final CodeTextFieldController controller = Get.put(CodeTextFieldController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return GestureDetector(
            onTap: () {
              controller.openKeyboard();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                10,
                (index) {
                  String writtenText = "";
                  if (controller.writtenCode[index].isNotEmpty) {
                    writtenText = controller.writtenCode[index];
                  }
                  return _buildSingleCell(writtenText);
                },
              ),
            ),
          );
        }),
        ThemeSizedBox.height8,
        const TitleMedium(
          "HAI BISOGNO DI AIUTO?",
          underline: true,
        ).applyShaders(context),
        Visibility.maintain(
          visible: false,
          child: IgnorePointer(
            child: TextField(
              autofocus: true,
              maxLength: 10,
              controller: controller.codeController,
              focusNode: controller.codeFocusNode,
              keyboardType: TextInputType.number,
              onChanged: (text) {
                controller.updateWrittenCode(text);
                widget.onChanged(text);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSingleCell(String text) {
    return Container(
      width: 30,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(
            0xFFE4D8E7,
          ),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
