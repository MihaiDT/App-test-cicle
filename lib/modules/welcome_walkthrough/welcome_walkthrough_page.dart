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
            title: "Personalizza Cherry, la mascotte di My Lines",
            description:
                "Cherry è la simpatica goccina che seguirà tutte le fasi del tuo ciclo mestruale. Personalizzala scegliendo tra tantissime espressioni ed accessori e prenditi cura di lei durante le mestruazioni.",
            image: Image.asset(
              ThemeImage.walkthrough1,
            ),
          ),
          WalkthroughData(
            title: "Monitora il ciclo mestruale",
            description:
                "Aggiungi le tue ultime mestruazioni nel calendario per seguire e tenere sotto controllo il tuo ciclo.",
            image: Image.asset(
              ThemeImage.walkthrough2,
            ),
          ),
          WalkthroughData(
            title: "Esplora un mondo di contenuti e consigli per te",
            description:
                "Articoli, tips e video divisi per area tematica per rispondere a tanti dubbi e curiosità sul mondo femminile.",
            image: Image.asset(
              ThemeImage.walkthrough3,
            ),
          ),
          WalkthroughData(
            title: "Più partecipi, più accumuli punti",
            description: "Partecipa alle missioni e ottieni punti per accedere a premi e contenuti esclusivi.",
            image: Image.asset(
              ThemeImage.walkthrough4,
            ),
          ),
          WalkthroughData(
            title: "Attiva il tuo calendario",
            description:
                "Consenti a My Lines di inviarti notifiche: ti aiuterà a monitorare il tuo ciclo e il tuo benessere inviandoti consigli e promemoria.",
            image: Image.asset(
              ThemeImage.walkthrough5,
            ),
          ),
        ],
      ),
    );
  }
}
