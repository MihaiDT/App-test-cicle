import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/consents/consents_controller.dart';
import 'package:lines/modules/drawer/sections/remove_account_section.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ConsentsPage extends GetView<ConsentsController> {
  const ConsentsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "GESTIONE CONSENSI",
          color: ThemeColor.primary,
        ),
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.7,
                      child: const HeadlineLarge(
                        "Consenso Marketing",
                        color: ThemeColor.darkBlue,
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () {
                        return CupertinoSwitch(
                          value: controller.isMarketingEnabled.value,
                          onChanged: (value) => controller.toggleMarketingEnabled(value),
                        );
                      },
                    ),
                  ],
                ),
                ..._marketingDescription(context),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.7,
                      child: const HeadlineLarge(
                        "Consenso Profilazione",
                        color: ThemeColor.darkBlue,
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () {
                        return CupertinoSwitch(
                          value: controller.isProfilingEnabled.value,
                          onChanged: (value) => controller.toggleProfilingEnabled(value),
                        );
                      },
                    ),
                  ],
                ),
                ..._profilingDescription(context),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.7,
                      child: const HeadlineLarge(
                        "Consenso Marketing terzi",
                        color: ThemeColor.darkBlue,
                        maxLines: 3,
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () {
                        return CupertinoSwitch(
                          value: controller.isBrandMarketingEnabled.value,
                          onChanged: (value) => controller.toggleBrandMarketingEnabled(value),
                        );
                      },
                    ),
                  ],
                ),
                ..._marketingBrandDescription(context),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.7,
                      child: const HeadlineLarge(
                        "Consenso servizio Calendario Mestruale",
                        color: ThemeColor.darkBlue,
                        maxLines: 3,
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () {
                        return CupertinoSwitch(
                          value: controller.isCalendarConsentEnabled.value,
                          onChanged: (value) => controller.toggleCalendarConsentEnabled(value),
                        );
                      },
                    ),
                  ],
                ),
                ..._calendarConsentDescription(context),
              ],
            ),
          ),
          const Divider(),
          if (appController.user.value!.hasMoreThan18Years) ...[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.7,
                        child: const HeadlineLarge(
                          "Consenso servizio Diario",
                          color: ThemeColor.darkBlue,
                          maxLines: 3,
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () {
                          return CupertinoSwitch(
                            value: controller.isDiaryConsentEnabled.value,
                            onChanged: (value) => controller.toggleDiaryConsentEnabled(value),
                          );
                        },
                      ),
                    ],
                  ),
                  ..._diaryConsentDescription(context),
                ],
              ),
            ),
            const Divider(),
          ],
          ThemeSizedBox.height40,
          const RemoveAccountSection(
            prefixText:
                "Ricorda che sono necessarie fino a 48 ore affinchè le modifiche privacy possano diventare attive.\n",
          ),
          ThemeSizedBox.height60,
        ],
      ),
    );
  }

  List<Widget> _diaryConsentDescription(BuildContext context) {
    return [
      ThemeSizedBox.height16,
      RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text: "Per utilizzare il servizio Diario acconsenti al trattamento dei ",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.diaryDataDetails),
              text: '"dati sulla tua salute e sulla tua sessualità"',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.brightPink,
                    height: 1.2,
                    decoration: TextDecoration.underline,
                    decorationColor: ThemeColor.brightPink,
                  ),
            ),
            TextSpan(
              text: " da te inseriti, come da ",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launchUrl(
                    Uri.parse(appController.settings.value?.privacyUrl ?? ''),
                    mode: LaunchMode.externalApplication,
                  );
                },
              text: 'informativa privacy',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.brightPink,
                    height: 1.2,
                    decoration: TextDecoration.underline,
                    decorationColor: ThemeColor.brightPink,
                  ),
            ),
            TextSpan(
              text:
                  '. Il consenso è necessario per utilizzare il servizio Diario dell’app e per salvare i dati inseriti.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _calendarConsentDescription(BuildContext context) {
    return [
      ThemeSizedBox.height16,
      RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  "Per utilizzare il servizio Calendario Mestruale acconsenti al trattamento dei dati relativi al ciclo, come da ",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launchUrl(
                    Uri.parse(appController.settings.value?.privacyUrl ?? ''),
                    mode: LaunchMode.externalApplication,
                  );
                },
              text: 'informativa privacy',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.brightPink,
                    height: 1.2,
                    decoration: TextDecoration.underline,
                    decorationColor: ThemeColor.brightPink,
                  ),
            ),
            TextSpan(
              text: '. Il consenso è necessario per utilizzare il servizio Calendario Mestruale.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _marketingBrandDescription(BuildContext context) {
    return [
      ThemeSizedBox.height16,
      BodySmall(
        "NON PERDERE LE NOVITÀ SU ALTRI PRODOTTI!",
        color: ThemeColor.darkBlue.withOpacity(0.5),
        fontWeight: FontWeight.w600,
      ),
      RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  'Ricevi comunicazioni sugli altri brand della famiglia Fater e sui nostri partner terzi e permettici di svolgere ricerche di mercato, come da ',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launchUrl(
                    Uri.parse(appController.settings.value?.privacyUrl ?? ''),
                    mode: LaunchMode.externalApplication,
                  );
                },
              text: 'informativa privacy',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.brightPink,
                    height: 1.2,
                    decoration: TextDecoration.underline,
                    decorationColor: ThemeColor.brightPink,
                  ),
            ),
            TextSpan(
              text: '.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _marketingDescription(BuildContext context) {
    return [
      ThemeSizedBox.height16,
      BodySmall(
        "RESTA AGGIORNATO SUL MONDO LINES",
        color: ThemeColor.darkBlue.withOpacity(0.5),
        fontWeight: FontWeight.w600,
      ),
      RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  'Vuoi conoscere tutte le novità che Lines sta pensando per te? Ricevi comunicazioni su Lines e permettici di svolgere ricerche di mercato, come da ',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launchUrl(
                    Uri.parse(appController.settings.value?.privacyUrl ?? ''),
                    mode: LaunchMode.externalApplication,
                  );
                },
              text: 'informativa privacy',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.brightPink,
                    height: 1.2,
                    decoration: TextDecoration.underline,
                    decorationColor: ThemeColor.brightPink,
                  ),
            ),
            TextSpan(
              text: '.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> _profilingDescription(BuildContext context) {
    return [
      ThemeSizedBox.height16,
      BodySmall(
        "CONTENUTI E MISSIONI PERSONALIZZATI PER TE!",
        color: ThemeColor.darkBlue.withOpacity(0.5),
        fontWeight: FontWeight.w600,
      ),
      RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  "Per noi è importante conoscere i tuoi interessi! Permettici di offrirti un'esperienza personalizzata inviandoti contenuti, comunicazioni e promozioni non generiche su Lines, e se lo vorrai, sugli altri marchi della famiglia Fater e sui nostri partner terzi, e di individuare nuovi contatti simili al tuo profilo, come da ",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  await launchUrl(
                    Uri.parse(appController.settings.value?.privacyUrl ?? ''),
                    mode: LaunchMode.externalApplication,
                  );
                },
              text: 'informativa privacy',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.brightPink,
                    height: 1.2,
                    decoration: TextDecoration.underline,
                    decorationColor: ThemeColor.brightPink,
                  ),
            ),
            TextSpan(
              text: '.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ThemeColor.darkBlue.withOpacity(0.5),
                    height: 1.2,
                  ),
            ),
          ],
        ),
      ),
    ];
  }
}
