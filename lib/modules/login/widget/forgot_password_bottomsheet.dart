import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/buttons/primary_loading_button.dart';

class ForgotPasswordBottomsheet extends StatelessWidget {
  final TextEditingController controller;
  final Function(String email) onConfirm;

  const ForgotPasswordBottomsheet({
    required this.controller,
    required this.onConfirm,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
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
            const DisplaySmall(
              "Recupera la tua password",
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
                hintText: "Inserisci email",
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
              isLoading: false,
              onPressed: () {
                onConfirm(controller.text);
                Navigator.pop(context);
              },
              child: const TitleLarge(
                "Invia email",
              ),
            ),
            ThemeSizedBox.height20,
          ],
        ),
      ),
    );
  }
}
