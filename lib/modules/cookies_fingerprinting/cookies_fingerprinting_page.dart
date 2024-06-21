import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/fullscreen_loader.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/cookies_fingerprinting/cookies_fingerprinting_controller.dart';
import 'package:lines/modules/cookies_fingerprinting/widgets/agree_check_buttons.dart';
import 'package:lines/repository/authentication_service.dart';
import 'package:lines/repository/parameters_class/update_user_parameters.dart';
import 'package:lines/routes/routes.dart';

import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class CookiesFingerprintingPage
    extends GetView<CookiesFingerprintingController> {
  const CookiesFingerprintingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "INFORMATIVA TRACCIATORI",
          color: ThemeColor.darkBlue,
        ),
        backButtonColor: ThemeColor.darkBlue,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: BottomWidgetLayout(
          scrollableAreaPadding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingSmall,
          ),
          bottomWidget: const SizedBox.shrink(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadlineLarge(
                  "Informativa sui tracciatori dell’app My Lines",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height32,
                const HeadlineLarge(
                  "Dati trattati con tracciatori:",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height16,
                const BodyMedium(
                  "1) IP addresses;\n"
                  "2) MAC addresses;\n"
                  "3) IDFA (stringa alfanumerica che identifica unicamente un device iPhone ma che si rigenera dopo il reset  del dispositivo) e IDFV (stringa che rende identificabile il device unicamente da parte del produttore dell'app in cui è inserito il software);\n"
                  "4) Android ID;\n"
                  "5) Google Play Advertising ID e Google Play Store Referrer;\n"
                  "6) Windows Hardware ID, Windows Network ID e Windows Phone;\n"
                  "7) Device ID;\n"
                  "8) UUIDs (Universally Unique Identifier);\n"
                  "9) Indirizzo email;\n"
                  "10) Marca e modello dispositivo;\n"
                  "11) Informazioni sull'hardware e sulla piattaforma utilizzata;\n"
                  "12) User Id;\n"
                  "13)Azioni effettuate in App.",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height32,
                const HeadlineLarge(
                  "Titolare del trattamento",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height16,
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "L'utilizzo di tracciatori da parte del titolare del trattamento, Fater S.p.A. (P.IVA 01282360682), con sede legale in Spoltore (Pescara-CAP 65010), Via Mare Adriatico n. 122, si inquadra nella Privacy Policy dello stesso; per tutte le informazioni richieste dall'art. 13 GDPR ",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.darkBlue,
                            ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                // TODO: privacy
                              },
                        text: 'clicca qui',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.brightPink,
                              height: 1.2,
                              decoration: TextDecoration.underline,
                              decorationColor: ThemeColor.brightPink,
                            ),
                      ),
                      TextSpan(
                        text: ".",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.darkBlue,
                            ),
                      ),
                    ],
                  ),
                ),
                const HeadlineLarge("Titolare del trattamento"),
                ThemeSizedBox.height32,
                const HeadlineLarge(
                  "Tracciatori tecnici che non richiedono il consenso",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height16,
                const BodyMedium(
                  "Tracciatori relativi ad attività strettamente necessarie al funzionamento della app e all'erogazione del servizio:\n"
                  "- Tracciatori di sessione che facilitano la navigazione e fruizione della app permettendo, ad es., di autenticarsi per accedere ad aree riservate (”tracciatori di navigazione o di sessione”);\n"
                  "- Tracciatori di sessione relativi ad attività di salvataggio delle preferenze, ad esempio, la lingua, o premi scelti in un concorso (”tracciatori di funzionalità”) al fine di migliorare il servizio reso;\n"
                  "- Tracciatori di performance che consentono di rilevare errori, guasti e malfunzionamenti della app ai fini della loro rapida risoluzione; i dati relativi sono conservati per il tempo strettamente necessario alla risoluzione del problema e comunque non oltre 90gg. \n"
                  "Tutti i tracciatori tecnici non richiedono consenso, perciò vengono installati automaticamente a seguito dell'accesso alla app.",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height32,
                const HeadlineLarge(
                  "Tracciatori per cui è richiesto il consenso",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height16,
                const BodyMedium(
                  "Tutti i tracciatori diversi da quelli tecnici sopra indicati vengono installati o attivati solo a seguito del consenso espresso dall'utente. Il consenso può essere espresso secondo le modalità indicate nella schermata dell’app con informativa breve oppure secondo le modalità indicate di seguito. Di questo consenso viene tenuta traccia in occasione delle visite successive alla app. Tuttavia, l'utente ha sempre la possibilità di revocare il consenso già espresso cliccando sul pulsante ”Non acconsento“ riportato di seguito.",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height32,
                const HeadlineLarge(
                  "Tracciatori statistici",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height16,
                const BodyMedium(
                  "Il titolare della app utilizza tracciatori statistici al fine di raccogliere informazioni sul numero degli utenti e su come questi visitano la app stessa, monitorare le performance dell’app e per valutare eventuali modifiche e miglioramenti da apportare all’App (”tracciatori analytics”).",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height8,
                const BodyMedium(
                  "Tracciatore statistico utilizzato:",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height8,
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: BodyMedium(
                    "•	Piwik PRO",
                    color: ThemeColor.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ThemeSizedBox.height8,
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Per ulteriori informazioni consulta la relativa privacy policy di questo fornitore a questo link ",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.darkBlue,
                            ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => {
                                // TODO: privacy
                              },
                        text:
                            'https://piwikpro.it/privacy-policy/?__hstc=229983747.4bf8e6efe7c31fcc605a0d332421dc21.1715239232097.1715239232097.1715239232097.1&__hssc=229983747.1.1715239232097&__hsfp=1343281090',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.brightPink,
                              height: 1.2,
                              decoration: TextDecoration.underline,
                              decorationColor: ThemeColor.brightPink,
                            ),
                      ),
                      TextSpan(
                        text:
                            "\nPer esprimere il tuo consenso all'utilizzazione del tracciatore Piwik  PRO o revocare un consenso già espresso clicca sui pulsanti “Acconsento“ o “Non Acconsento“ qui sotto:",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.darkBlue,
                            ),
                      ),
                    ],
                  ),
                ),
                ThemeSizedBox.height16,
                AgreeCheckButtons(
                  agree: HiveManager.hasAcceptedCookieStats,
                  onChanged: (value) {
                    HiveManager.hasAcceptedCookieStats = value;
                  },
                ),
                ThemeSizedBox.height32,
                const HeadlineLarge(
                  "Tracciatori di profilazione",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height8,
                const BodyMedium(
                  "Il titolare della app utilizza tracciatori di profilazione, anche di terze parti, per ottimizzare le campagne pubblicitarie Lines, migliorare l'offerta e i servizi della app in linea con le preferenze, le caratteristiche ed interessi manifestati dall'utente, per alimentare la sezione dei badge nel profilo, per individuare nuovi contatti simili al profilo dell'utente interessati a ricevere messaggi pubblicitari personalizzati (anche per il tramite di incrocio con dati provenienti da altre fonti, quali ad es. social networks). ",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height8,
                const BodyMedium(
                  "Tracciatori di profilazione utilizzati:",
                  color: ThemeColor.darkBlue,
                ),
                ThemeSizedBox.height8,
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: BodyMedium(
                    "• META",
                    color: ThemeColor.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ThemeSizedBox.height8,
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Per ulteriori informazioni consulta la privacy policy di questo fornitore a questo link ",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.darkBlue,
                            ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrl(
                              Uri.parse(
                                'https://www.facebook.com/privacy/policy/',
                              ),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                        text: 'https://www.facebook.com/privacy/policy/',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.brightPink,
                              height: 1.2,
                              decoration: TextDecoration.underline,
                              decorationColor: ThemeColor.brightPink,
                            ),
                      ),
                    ],
                  ),
                ),
                ThemeSizedBox.height16,
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: BodyMedium(
                    "• Adjust GmbH",
                    color: ThemeColor.darkBlue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ThemeSizedBox.height8,
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "Per ulteriori informazioni consulta la privacy policy di questo fornitore a questo link ",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.darkBlue,
                            ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await launchUrl(
                              Uri.parse(
                                "https://www.adjust.com/terms/privacy-policy/",
                              ),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                        text: 'https://www.adjust.com/terms/privacy-policy/',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.brightPink,
                              height: 1.2,
                              decoration: TextDecoration.underline,
                              decorationColor: ThemeColor.brightPink,
                            ),
                      ),
                      TextSpan(
                        text:
                            "\nPer esprimere il tuo consenso all'utilizzazione del tracciatore Meta e Adjust GmbH o revocare un consenso già espresso clicca sui pulsanti ”Acconsento” o ”Non Acconsento” qui sotto:",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ThemeColor.darkBlue,
                            ),
                      ),
                    ],
                  ),
                ),
                ThemeSizedBox.height16,
                AgreeCheckButtons(
                  agree: HiveManager.hasAcceptedCookieProfiling,
                  onChanged: (value) {
                    HiveManager.hasAcceptedCookieProfiling = value;
                  },
                ),
                ThemeSizedBox.height40,
                PrimaryButton(
                  onPressed: () => navigateToNextPage(),
                  child: const TitleLarge(
                    "CONFERMA",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void navigateToNextPage() {
    Get.back();

    if (controller.isEditing) {
      _updateConsents();
      Get.back();
      showFullScreenLoader();
    } else {
      Get.offAndToNamed(
        appController.isLoginFlow.value == true
            ? Routes.login
            : Routes.register,
      );
    }
  }

  Future<void> _updateConsents() async {
    await AuthenticationService.updatePrivacy(
      UpdateUserParameters(
        hasConsentCookieProfiling: HiveManager.hasAcceptedCookieProfiling,
        hasConsentCookieStats: HiveManager.hasAcceptedCookieStats,
      ),
    );
  }
}
