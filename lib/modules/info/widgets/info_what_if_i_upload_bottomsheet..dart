import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';

class InfoWhatIfIUploadBottomSheet extends StatelessWidget {
  const InfoWhatIfIUploadBottomSheet({
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
          ThemeSizedBox.height32,
          const DisplayMedium(
            "E se carico un codice prodotto di una missione?",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height32,
          const BodyLarge(
            "Se carichi nella sezione generica \"Carica codice\"...missione.Ti basterà portarla a compimento nei termini stabiliti per ricevere immediatamente il tuo premio all'indirizzo email di registrazione. Se non disponibile riceverai il premio entro qualche giorno. Se il codice inserito può partecipare a più missioni potrai scegliere a quale vuoi partecipare.",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height32,
        ],
      ),
    );
  }
}
