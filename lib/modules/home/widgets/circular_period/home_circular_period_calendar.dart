import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/enums/period_phase.dart';
import 'package:lines/data/models/period_date.dart';
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
    final homeController = Get.find<HomeController>();

    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ThemeSizedBox.height4,
              const HeadlineMedium(
                "Inserisci le tue\nultime mestruazioni\nper iniziare",
                color: ThemeColor.darkBlue,
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height20,
              IntrinsicWidth(
                child: PrimaryButton(
                  key: homeController.homeCircularPeriodAddButtonKey,
                  buttonSize: ButtonSize.h31,
                  onPressed: () {
                    Get.toNamed(Routes.calendar);
                  },
                  child: const TitleLarge("Aggiungi mestruazioni"),
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
      ),
    );
  }

  Widget get _avatarBody {
    final periodDate = controller.currentPeriodDatesMap.values
        .toList()[controller.periodSelectedDateIndex.value];

    return SizedBox(
      height: size,
      child: Obx(
        () => Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: getAvatar(
                  controller.homeCircularPeriodCalendarKey,
                  periodDate.periodPhase,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  children: [
                    TitleMedium(
                      periodDate.periodPhase.phaseLabel.toUpperCase(),
                      color: const Color(0xffB438B2),
                      fontWeight: ThemeTextStyle.weightBold,
                      textAlign: TextAlign.center,
                      letterSpacing: 2,
                    ),
                    BodySmall(
                      subtitlePhase(periodDate),
                      color: ThemeColor.darkBlue,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            if (controller.playButtonVisible)
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
    );
  }

  Widget getAvatar(
    Key key,
    PeriodPhase phase,
  ) {
    String avatarImgUrl = '';

    switch (phase.name) {
      case 'menstruation':
        avatarImgUrl =
            appController.user.value!.avatarPhase0ImgUrl ?? ThemeImage.avatar0;
      case 'follicular':
        avatarImgUrl =
            appController.user.value!.avatarPhase1ImgUrl ?? ThemeImage.avatar1;
      case 'ovulation':
        avatarImgUrl =
            appController.user.value!.avatarPhase2ImgUrl ?? ThemeImage.avatar2;
      case 'luteal':
        avatarImgUrl =
            appController.user.value!.avatarPhase3ImgUrl ?? ThemeImage.avatar3;
      case 'noPhase':
        avatarImgUrl =
            appController.user.value!.avatarPhase3ImgUrl ?? ThemeImage.avatar3;
      default:
        avatarImgUrl = '';
    }

    return InkWell(
      onTap: () async {
        final sessionToken = await SecureStorageManager().getToken();
        Get.toNamed(
          Routes.customizeCherryWebView,
          arguments: {
            'sessionToken': sessionToken,
          },
        );
      },
      child: SizedBox(
        key: key,
        width: 140,
        height: 140,
        child: appController.user.value!.isAvatarConfigured
            ? Image.network(
                avatarImgUrl,
                fit: BoxFit.scaleDown,
              )
            : Image.asset(
                avatarImgUrl,
                fit: BoxFit.scaleDown,
              ),
      ),
    );
  }

  String subtitlePhase(PeriodDate periodDate) {
    if (periodDate.periodPhase.name == PeriodPhase.ovulation.name) {
      return periodDate.isOvulationDay ? 'Massima fertilità' : 'Alta fertilità';
    }
    if (periodDate.periodPhase.name == PeriodPhase.follicular.name ||
        periodDate.periodPhase.name == PeriodPhase.luteal.name) {
      return 'Bassa fertilità';
    }
    if (periodDate.periodPhase.name == 'noPhase') {
      // Ritardo
      return '';
      // "${appController.currentPeriod.value?.menstruationInfo[1]} ${appController.currentPeriod.value?.menstruationInfo[2].toLowerCase()}";
    }

    return '';
  }
}
