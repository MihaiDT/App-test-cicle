import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/modules/change_profile/controller/customize_cherry_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/cards/elevated_card.dart';

class CustomizeCherry extends GetView<CustomizeCherryController> {
  const CustomizeCherry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      onPressed: () async {
        final sessionToken = await SecureStorageManager().getToken();

        Get.toNamed(
          Routes.customizeCherryWebView,
          arguments: {
            'sessionToken': sessionToken,
          },
        );
      },
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 18,
          top: 18,
          bottom: 24,
        ),
        child: LayoutBuilder(
          builder: (context, constrains) {
            return Row(
              children: [
                SizedBox(
                  width: constrains.maxWidth * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const DisplayMedium(
                        "Personalizza Cherry",
                      ).applyShaders(context),
                      ThemeSizedBox.height16,
                      // const BodySmall(
                      //   "oggetti selezionati:",
                      //   color: ThemeColor.darkBlue,
                      // ),
                      // ThemeSizedBox.height8,
                      // Row(
                      //   children: controller.selectedObjects,
                      // ),
                      const TitleMedium(
                        "PERSONALIZZA",
                        underline: true,
                        letterSpacing: 1.5,
                      ).applyShaders(context),
                    ],
                  ),
                ),
                Image.asset(
                  ThemeImage.mockAvatar,
                  fit: BoxFit.scaleDown,
                  width: constrains.maxWidth * 0.3,
                  height: constrains.maxWidth * 0.3,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
