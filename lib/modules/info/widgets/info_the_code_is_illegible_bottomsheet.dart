import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoTheCodeIsIllegibleBottomSheet extends StatelessWidget {
  const InfoTheCodeIsIllegibleBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      child: Column(
        children: [
          ThemeSizedBox.height8,
          const DisplayMedium(
            "Il codice sulla confezione è illeggibile",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height32,
          const BodyLarge(
            "Se il codice all'interno del pack è illeggibile o riscontri problemi nell'inserimento, contatta il Servizio Consumatori.",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height32,
          PrimaryButton(
            child: const TitleLarge(
              "CONTATTACI",
              letterSpacing: 2,
            ),
            onPressed: () {
              Navigator.pop(context);
              launchUrl(
                Uri.parse(appController.settings.value?.helpdeskUrl ?? ''),
              );
            },
          ),
          ThemeSizedBox.height48,
        ],
      ),
    );
  }
}
