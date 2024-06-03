import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/privacy_and_conditions/privacy_and_contitions_controller.dart';
import 'package:lines/routes/routes.dart';

import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class PrivacyAndConditionsPage extends GetView<PrivacyAndConditionsController> {
  const PrivacyAndConditionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "ASSISTENZA",
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
              onTap: () => Get.toNamed(Routes.privacyDetails),
              child: Column(
                children: [
                  Row(
                    children: [
                      const HeadlineSmall(
                        "Informativa Privacy",
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
              onTap: () => {},
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
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: ThemeSize.paddingSmall,
            ),
            child: InkWell(
              onTap: () => Get.toNamed(Routes.privacyDetails),
              child: Column(
                children: [
                  Row(
                    children: [
                      const HeadlineSmall(
                        "Cokie e fingerprinting",
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
        ],
      ),
    );
  }
}
