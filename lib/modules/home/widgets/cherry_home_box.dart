import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_image.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/modules/home/home_controller.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/cards/elevated_card.dart';

class CherryHomeBox extends StatelessWidget {
  const CherryHomeBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedCard.withBorder(
      margin: const EdgeInsets.symmetric(
        horizontal: ThemeSize.paddingSmall,
      ),
      borderColor: Colors.white.withOpacity(0.6),
      onPressed: () async {
        final sessionToken = await SecureStorageManager().getToken();

        if (homeController.playButtonVisible) {
          Get.toNamed(
            Routes.tamagochiWebView,
            arguments: {
              'sessionToken': sessionToken,
            },
          );
        } else if (!homeController.hasSavedPeriodInfo) {
          Get.toNamed(Routes.calendar);
        } else {
          Get.toNamed(
            Routes.customizeCherryWebView,
            arguments: {
              'sessionToken': sessionToken,
            },
          );
        }
      },
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
          left: 20,
          right: 12,
          top: 12,
        ),
        child: LayoutBuilder(
          builder: (context, constrains) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: constrains.maxWidth * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Obx(
                        () => DisplayMedium(
                          title,
                        ).applyShaders(context),
                      ),
                      ThemeSizedBox.height4,
                      Obx(
                        () => BodyMedium(
                          description,
                          color: ThemeColor.darkBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Image.asset(
                  ThemeImage.cherryHomeBox,
                  fit: BoxFit.scaleDown,
                  width: constrains.maxWidth * 0.28,
                  height: constrains.maxWidth * 0.28,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  HomeController get homeController => Get.find<HomeController>();

  String get title {
    if (homeController.playButtonVisible) {
      return "Gioca con Cherry";
    }
    if (!homeController.hasSavedPeriodInfo) {
      return "Scopri Cherry";
    }
    return "Personalizza Cherry";
  }

  String get description {
    if (homeController.playButtonVisible) {
      return "Divertiti con Cherry e prenditi cura di lei durante le mestruazioni!";
    }
    if (!homeController.hasSavedPeriodInfo) {
      return "Aggiungi le tue mestruazioni per iniziare ad interagire con Cherry.";
    }
    return "Scopri tutte le personalizzazioni e rendi la tua Cherry unica!";
  }
}
