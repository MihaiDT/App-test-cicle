import 'package:flutter/material.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';

class ActivateEmailDialog extends StatelessWidget {
  const ActivateEmailDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingLarge,
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 38,
          vertical: 40,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DisplayMedium(
              "Non hai ancora attivato il tuo account",
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height16,
            const BodyLarge(
              "Controlla la tua casella di posta indesiderata se non la trovi prova con",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height8,
            const BodyLarge(
              "Invia di nuovo",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
              underline: true,
              decorationColor: ThemeColor.darkBlue,
            ),
          ],
        ),
      ),
    );
  }
}
