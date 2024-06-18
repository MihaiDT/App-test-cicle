import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/welcome/welcome_controller.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';

class WelcomeSigninButton extends StatelessWidget {
  final WelcomeController controller;

  const WelcomeSigninButton(
    this.controller, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      onPressed: () => controller.onTapSignin(),
      child: const TitleLarge(
        "INIZIAMO!",
        letterSpacing: 2,
      ).applyShaders(context),
    );
  }
}
