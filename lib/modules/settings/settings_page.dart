import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/settings/settings_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({
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
              vertical: 8,
            ),
            child: Row(
              children: [
                const HeadlineSmall(
                  "Notifiche",
                  color: ThemeColor.darkBlue,
                ),
                const Spacer(),
                Obx(
                  () {
                    return CupertinoSwitch(
                      value: controller.isNotificationEnabled.value,
                      onChanged: (value) {
                        controller.isNotificationEnabled.value = value;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: ThemeSize.paddingSmall,
            ),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Row(
                    children: [
                      const HeadlineSmall(
                        "Gestione consensi",
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
              onTap: () {},
              child: Column(
                children: [
                  Row(
                    children: [
                      const HeadlineSmall(
                        "Cookie e Fingerprint",
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
              onTap: () {},
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
        ],
      ),
    );
  }
}
