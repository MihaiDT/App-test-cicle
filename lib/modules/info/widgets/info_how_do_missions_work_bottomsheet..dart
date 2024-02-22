import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/info/widgets/info_paragraph.dart';

class InfoHowDoMissionsWorkBottomSheet extends StatelessWidget {
  const InfoHowDoMissionsWorkBottomSheet({
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
            "Come funzionano le\nmissioni?",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height32,
          const InfoParagraph(
            title: "Missioni: cosa sono?",
            description:
                "Le missioni sono degli incarichi mensili collegate all’acquisto dei prodotti Lines: ogni mese potrai accedere a missioni diverse. Ricorda che ogni missione ha una scadenza: leggi bene il regolamento di ciascuna missione e portala a termine nei tempi stabiliti.",
          ),
          ThemeSizedBox.height32,
          const InfoParagraph(
            title: "Come si accede alle missioni?",
            description:
                "Puoi accedervi acquistando i prodotti Lines che ti vengono segnalati in ciascuna missione. Poi ti basterà caricare i codici che trovi all’interno delle confezioni, nella pagina missioni. Se la missione richiede il caricamento di più codici puoi caricarli in momenti diversi, l'importante è che tutti i codici richieste siano caricati entro la scadenza della missione. Quando avrai completato il caricamento di tutti i codici richiesti, avrai accesso al tuo premio. Se subito disponibile riceverai immediatamente il codice sconto nella tua email di registrazione (controlla la posta indesiderata!) Altrimenti dovrai pazientare qualche giorno: ti invieremo il codice sconto per email appena tornerà disponibile. Mi raccomando, segui le indicazioni per utilizzare il codice sconto tenendo conto della sua data di scadenza. Puoi partecipare più volte ad una stessa missione, per un numero massimo di volte riportato all'interno della missione e nel suo regolamento.",
          ),
          ThemeSizedBox.height32,
        ],
      ),
    );
  }
}
