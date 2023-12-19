import 'package:flutter/material.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';

import '../../../widgets/buttons/app_button.dart';
import '../welcome_controller.dart';

class WelcomeSigninButton extends StatelessWidget {
  final WelcomeController controller;

  const WelcomeSigninButton(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      text: "INIZIAMO!",
      onPressed: () => controller.onTapSignin(),
    );
  }
}
