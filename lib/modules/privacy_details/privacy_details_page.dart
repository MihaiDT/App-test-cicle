import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/privacy_details/privacy_details_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

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
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: ThemeSize.paddingSmall,
            ),
            child: InkWell(
              onTap: () => {},
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
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: ThemeSize.paddingSmall,
            ),
            child: InkWell(
              onTap: () => Get.toNamed(Routes.cookiesFingerprinting),
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
