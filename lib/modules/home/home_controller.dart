// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/models/period_date.dart';
import 'package:lines/modules/home/widgets/horizontal_calendar/home_horizontal_calendar.dart';
import 'package:lines/modules/tutorial/widgets/menses_phase_card.dart';
import 'package:lines/modules/tutorial/widgets/tutorial_continue_button.dart';
import 'package:lines/modules/welcome_quiz/widgets/welcome_quiz_alert_dialog.dart';
import 'package:lines/repository/calendar_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/tutorial_check_mark/src/target/target_content.dart';
import 'package:lines/tutorial_check_mark/src/target/target_focus.dart';
import 'package:lines/tutorial_check_mark/tutorial_coach_mark.dart';
import 'package:lines/widgets/layouts/app_scaffold_controller.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeController extends AppScaffoldController {
  TutorialCoachMark? tutorialCoachMark;
  final RxInt tutorialStep = 0.obs;

  final GlobalKey homeCircularPeriodCalendarKey = GlobalKey();

  // late final HomeHorizontalCalendarController horizontalCalendarController;
  RxInt counter = 0.obs;
  bool updating = false;
  final scrollSnapListKey = GlobalKey<ScrollSnapListState>();

  RxBool rxPlayButtonVisible = false.obs;

  bool get playButtonVisible => rxPlayButtonVisible.value;

  set playButtonVisible(bool newValue) => rxPlayButtonVisible.value = newValue;

  RxInt rxPeriodSelectedDateIndex = 0.obs;

  int get periodSelectedDateIndex => rxPeriodSelectedDateIndex.value;

  set periodSelectedDateIndex(int newValue) =>
      rxPeriodSelectedDateIndex.value = newValue;

  Map<String, PeriodDate> get currentPeriodDatesMap =>
      appController.currentPeriod.value?.dates ?? {};
  List<TargetFocus> targets = <TargetFocus>[];

  @override
  void onReady() {
    super.onReady();
    _initCalendars();

    ever(
      appController.currentPeriod.rxValue,
      condition: () =>
          Get.currentRoute == Routes.main &&
          !HiveManager.isFirstTutorialWatched,
      (callback) {
        HiveManager.isFirstTutorialWatched = true;
        // The Future.delayed is a workaround to ensure that
        // the homeCircularPeriodCalendarKey is in the correct position
        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            if (callback.isSuccessful) {
              targets.addAll(
                [
                  TargetFocus(
                    paddingFocus: 10,
                    identify: "homeCircularPeriodCalendarKey",
                    keyTarget: homeCircularPeriodCalendarKey,
                    contents: [
                      TargetContent(
                        align: ContentAlign.top,
                        padding: EdgeInsets.zero,
                        builder: (context, controller) {
                          return Obx(
                            () {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 12,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          hideTutorial();
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility.maintain(
                                    visible: tutorialStep.value != 1,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 50,
                                          ),
                                          child: DisplayMedium(
                                            tutorialStep.value == 0
                                                ? "Ciao! Io sono Cherry, e rappresento il tuo ciclo mestruale."
                                                : "Ora, che ne dici di iniziare con la mia personalizzazione?",
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        ThemeSizedBox.height8,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 35,
                                          ),
                                          child: Image.asset(
                                            ThemeImage.speechBubble,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
              tutorialCoachMark = TutorialCoachMark(
                skipWidget: Obx(
                  () {
                    if (tutorialStep.value == 0) {
                      return TutorialContinueButton(
                        goToNextTutorial: goToNextTutorial,
                      );
                    } else if (tutorialStep.value == 1) {
                      return MensesPhaseCard(
                        goToNextTutorial: goToNextTutorial,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                colorShadow: Colors.black,
                targets: targets,
                opacityShadow: 0.6,
                paddingFocus: 10,
                pulseEnable: false,
                onFinish: () {
                  print("finish");
                },
                onClickTarget: (target) {
                  print(target);
                },
              );

              showTutorial();
            }
          },
        );
      },
    );

    if (HiveManager.numberOfAccess >= 2 &&
        HiveManager.numberOfAccess <= 4 &&
        !isWelcomeQuizCompleted) {
      showErrorDialog(
        context: Get.context!,
        builder: (_) {
          return WelcomeQuizAlertDialog();
        },
      );
    }

    HiveManager.numberOfAccess++;
  }

  void showTutorial() {
    tutorialCoachMark?.show(context: Get.context!);
  }

  void hideTutorial() {
    tutorialCoachMark?.finish();
  }

  void goToNextTutorial() {
    tutorialStep.value++;
  }

  void horizontalCalendarOnItemFocus(int index) {
    periodSelectedDateIndex = index;

    playButtonVisible = false;
    // FIXME: dateFormatYMD.format(dates[periodSelectedDateIndex]) == dateFormatYMD.format(DateTime.now());
    // TODO: cambio immagine avatar e colore
  }

  Rx<DateTime> get selectedDate {
    return DateTime.now().obs;
  }

  void _initCalendars() async {
    await CalendarService.fetchCurrentPeriod();
    await CalendarService.fetchCalendarData();

    Get.put(const HomeHorizontalCalendar());

    final formattedTodayDate = dateFormatYMD.format(DateTime.now());

    periodSelectedDateIndex =
        currentPeriodDatesMap.keys.toList().indexOf(formattedTodayDate);
    periodSelectedDateIndex = periodSelectedDateIndex < 0
        ? currentPeriodDatesMap.keys.toList().length
        : periodSelectedDateIndex;
  }

  bool get isWelcomeQuizCompleted =>
      appController.user.value?.isWelcomeQuizCompleted ?? false;
}
