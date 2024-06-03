import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:url_launcher/url_launcher.dart';

class RemoveAccountSection extends StatelessWidget {
  final String? prefixText;

  const RemoveAccountSection({
    super.key,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.normalGrey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
          vertical: ThemeSize.paddingMedium,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixText != null)
              BodyMedium(
                prefixText!,
                color: ThemeColor.darkBlue,
              ),
            const BodyMedium(
              "Per cancellare l'account accedi al ",
              color: ThemeColor.darkBlue,
            ),
            const BodyMedium(
              "Privacy Portal Fater.",
            ).applyShaders(context),
            const BodyMedium(
              "Se sei iscritto con i social o non ricordi la password accedi utilizzando l'invio del link all'email di registrazione dal riquadro in basso a destra.",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height12,
            IntrinsicWidth(
              child: PrimaryButton(
                buttonSize: ButtonSize.h31,
                onPressed: () async {
                  final Uri url =
                      Uri.parse('https://www.fatergroup.com/it/privacy');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: const HeadlineSmall(
                  "Privacy Portal Fater",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
