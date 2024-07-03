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
          ThemeSizedBox.height8,
          const DisplayMedium(
            "E se carico un codice\n prodotto di una missione?",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height32,
          const BodyLarge(
            "Se carichi il codice all’interno della missione la completerai (se è richiesto un solo caricamento) oppure avrai fatto uno step verso il suo completamento. Se carichi il codice nella sezione generica “Carica codice” il prodotto parteciperà automaticamente alla missione.\n Ti basterà portarla compimento nei termini stabiliti per ricevere immediatamente il tuo premio all'indirizzo e-mail di registrazione. Se non disponibile riceverai il premio entro qualche giorno. Se il codice inserito può partecipare a più missioni potrai scegliere a quale vuoi partecipare.",
            color: ThemeColor.darkBlue,
            textAlign: TextAlign.center,
          ),
          ThemeSizedBox.height32,
        ],
      ),
    );
  }
}
