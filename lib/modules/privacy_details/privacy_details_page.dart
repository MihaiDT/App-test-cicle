import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/privacy_details/privacy_details_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyDetailsPage extends GetView<PrivacyDetailsController> {
  const PrivacyDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "PRIVACY E CONDIZIONI DI UTILIZZO",
          color: ThemeColor.primary,
        ),
        backButtonColor: ThemeColor.darkBlue,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        children: [
          const Divider(),
          InkWell(
            onTap: () async {
              await launchUrl(
                Uri.parse(appController.settings.value?.privacyUrl ?? ''),
                mode: LaunchMode.externalApplication,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeSize.paddingSmall,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const HeadlineSmall(
                        "Informativa privacy",
                        color: ThemeColor.darkBlue,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        ThemeIcon.arrowRight,
                        color: ThemeColor.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () async {
              await launchUrl(
                Uri.parse(
                  appController.settings.value?.termsAndConditionsUrl ?? '',
                ),
                mode: LaunchMode.externalApplication,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeSize.paddingSmall,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const HeadlineSmall(
                        "Condizioni di utilizzo",
                        color: ThemeColor.darkBlue,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        ThemeIcon.arrowRight,
                        color: ThemeColor.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          InkWell(
            onTap: () => Get.toNamed(
              Routes.cookiesFingerprinting,
              arguments: true,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: ThemeSize.paddingSmall,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const HeadlineSmall(
                        "Informativa tracciatori",
                        color: ThemeColor.darkBlue,
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        ThemeIcon.arrowRight,
                        color: ThemeColor.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
