import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/walkthrough_data.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/walkthrough/walkthrough.dart';

class WelcomeWalkthroughPage extends StatelessWidget {
  const WelcomeWalkthroughPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      body: Walkthrough(
        onTapLetsStart: () {
          Get.offAndToNamed(Routes.main);
        },
        pagesData: [
          WalkthroughData(
            title: "Personalizza la tua Cherry e gioca",
            description:
                "Personalizza la tua Cherry come più ti piace per rendere l'app ancora più tua!\nE quando ha i le mestruazioni non dimenticare di giocare e prenderti cura di lei.",
            image: const Placeholder(),
          ),
          WalkthroughData(
            title: "Monitora il ciclo mestruale",
            description:
                "Tieni sempre sotto controllo il tuo calendario mestruale, monitora i sintomi, registra l'attività sessuale e prendi nota dell'andamento del tuo benessere lungo tutto il mese.",
            image: Image.asset(
              ThemeImage.walkthrough2,
            ),
          ),
          WalkthroughData(
            title: "Consigli e contenuti di esperti solo per te",
            description:
                "Accedi a tanti contenuti creati per te dai nostri esperti e professionisti e approfondisci i topic più rilevanti per la fase del ciclo in cui ti trovi.",
            image: Image.asset(
              ThemeImage.walkthrough3,
            ),
          ),
          WalkthroughData(
            title: "Più partecipi, più accumuli punti",
            description:
                "Partecipa alle missioni e ottieni punti per accedere a premi e contenuti esclusivi.",
            image: Image.asset(
              ThemeImage.walkthrough4,
            ),
          ),
          WalkthroughData(
            title: "Attiva il tuo calendario",
            description:
                "Consenti a MyLines di inviarti notifiche: ti aiuterà a monitorare il tuo ciclo e il tuo benessere inviandoti consigli e promemoria.",
            image: Image.asset(
              ThemeImage.walkthrough5,
            ),
          ),
        ],
      ),
    );
  }
}
