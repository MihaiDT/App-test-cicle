import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/push_notification.dart';
import 'package:lines/data/models/walkthrough_data.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/walkthrough/controller/walkthrough_controller.dart';
import 'package:lines/widgets/walkthrough/walkthrough.dart';

class WelcomeWalkthroughPage extends GetView<WalkthroughController> {
  const WelcomeWalkthroughPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: AppScaffoldPage(
        backgroundColor: Colors.white,
        body: Walkthrough(
          onTapLetsStart: () async {
            await PushNotification.requestPushPermission();

            Get.offAllNamed(Routes.main);
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
              title: "Scopri i fantastici premi che ti aspettano!",
              description:
                  "Carica i codici dei prodotti Lines per completare le missioni, accumulare coins e partecipare a concorsi .",
              image: Image.asset(
                ThemeImage.walkthrough4,
              ),
            ),
            WalkthroughData(
              title: "Attiva le notifiche!",
              description:
                  "Ti aiuteremo a non farti cogliere di sorpresa dall’arrivo delle mestruazioni!",
              image: Image.asset(
                ThemeImage.walkthrough5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
