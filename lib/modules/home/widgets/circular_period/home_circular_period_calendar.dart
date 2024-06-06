import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/modules/home/home_controller.dart';
import 'package:lines/modules/home/widgets/circular_period/circular_calendar.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';

class HomeCircularPeriodCalendar extends GetView<HomeController> {
  static final size = Get.width * 0.74;

  const HomeCircularPeriodCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (controller.hasSavedPeriodInfo)
          Center(
            child: SizedBox(
              height: size,
              width: size,
              child: const CircularCalendar(),
            ),
          ),
        _avatarContainer,
      ],
    );
  }

  Widget get _avatarContainer {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: Center(
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size - 60),
              boxShadow: [ThemeShadow.homeAvatarContainerShadow],
              color: const Color(0xffF5F5F5).withOpacity(0.4),
            ),
            height: size - 60,
            width: size - 60,
            child: Obx(
              () => controller.hasSavedPeriodInfo
                  ? _avatarBody
                  : missingDataContainer,
            ),
          ),
        ),
      ),
    );
  }

  Widget get missingDataContainer {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThemeSizedBox.height4,
            const HeadlineMedium(
              "Inserisci le tue ultime mestruazioni per iniziare",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height20,
            IntrinsicWidth(
              child: PrimaryButton(
                buttonSize: ButtonSize.h31,
                onPressed: () {
                  Get.toNamed(Routes.calendar);
                },
                child: const TitleMedium(
                  "Aggiungi mestruazioni",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1000),
              child: SizedBox.shrink(
                key: controller.missingMensesPrimaryButtonKey,
              ),
            ),
            ThemeSizedBox.height4,
          ],
        ),
      ),
    );
  }

  Widget get _avatarBody {
    final periodDate = controller.currentPeriodDatesMap.values
        .toList()[controller.periodSelectedDateIndex.value];

    return SizedBox(
      height: size,
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   mainAxisSize: MainAxisSize.max,
      //   children: [
      //     ThemeSizedBox.height4,
      //     TitleSmall(
      //       "FASE\n${periodDate.periodPhase.phaseLabel.toUpperCase()}",
      //       color: const Color(0xffB438B2),
      //       fontWeight: NewThemeTextStyle.weightBold,
      //       textAlign: TextAlign.center,
      //     ),
      child: Obx(
        () => Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: getAvatar(controller.homeCircularPeriodCalendarKey),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TitleSmall(
                  "FASE\n${periodDate.periodPhase.phaseLabel.toUpperCase()}",
                  color: const Color(0xffB438B2),
                  fontWeight: NewThemeTextStyle.weightBold,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (controller.playButtonVisible || true)
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SecondaryButton(
                      buttonSize: ButtonSize.h31,
                      boxShadowVisible: false,
                      onPressed: () async {
                        final sessionToken =
                            await SecureStorageManager().getToken();
                        Get.toNamed(
                          Routes.tamagochiWebView,
                          arguments: {
                            'sessionToken': sessionToken,
                          },
                        );
                      },
                      child: Center(
                        child: const LabelLarge(
                          "GIOCA",
                          letterSpacing: 2,
                        ).applyShaders(Get.context!),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      // ThemeSizedBox.height4,
      //   ],
      // ),
    );
  }

  Widget getAvatar(Key key) {
    return SizedBox(
      key: key,
      width: 110,
      height: 140,
      child: Image.asset(
        ThemeImage.mockAvatar,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
