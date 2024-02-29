import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';

class ChangeProfileBottomsheet extends StatelessWidget {
  final String title;
  final Function(String) onConfirm;

  final bool isButtonLoading;
  final TextEditingController controller;

  const ChangeProfileBottomsheet({
    required this.title,
    required this.onConfirm,
    required this.isButtonLoading,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 19,
              right: 19,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ThemeSizedBox.height24,
                DisplaySmall(
                  title,
                  fontWeight: FontWeight.w500,
                ).applyShaders(context),
                ThemeSizedBox.height16,
                TextField(
                  autofocus: true,
                  controller: controller,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Inserisci le tue informazioni",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    fillColor: Color(0xfff3eef4),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                ThemeSizedBox.height20,
                PrimaryLoadingButton(
                  isLoading: isButtonLoading,
                  child: const TitleLarge(
                    "Salva",
                  ),
                  onPressed: () {
                    print("onPressedonPressed");
                    print("onPressedonPressed");
                    print("onPressedonPressed");
                    print("onPressedonPressed");
                    print("onPressedonPressed");
                    onConfirm(controller.text);
                  },
                ),
                ThemeSizedBox.height20,
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
