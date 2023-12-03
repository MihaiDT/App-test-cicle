import 'package:flutter/material.dart';

import '../../../widgets/buttons/app_button.dart';
import '../welcome_controller.dart';

class WelcomeSigninButton extends StatelessWidget {
  final WelcomeController controller;

  const WelcomeSigninButton(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      gradient: false,
      filled: true,
      text: "INIZIAMO!",
      onTap: () => controller.onTapSignin(),
    );
  }
}
