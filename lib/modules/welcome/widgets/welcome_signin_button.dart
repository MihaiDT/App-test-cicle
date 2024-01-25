import 'package:flutter/material.dart';
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
      text: "INIZIAMO!",
      onPressed: () => controller.onTapSignin(),
    );
  }
}
