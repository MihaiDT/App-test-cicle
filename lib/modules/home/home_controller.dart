// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/hive_manager.dart';
import 'package:lines/core/helpers/secure_storage_manager.dart';
import 'package:lines/core/helpers/show_error_dialog.dart';
import 'package:lines/core/utils/helpers.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/data/enums/period_phase.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_article_detail_pair.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/data/models/period_date.dart';
import 'package:lines/modules/tutorial/widgets/menses_phase_card.dart';
import 'package:lines/modules/tutorial/widgets/tutorial_close_button.dart';
import 'package:lines/modules/tutorial/widgets/tutorial_continue_button.dart';
import 'package:lines/modules/welcome_quiz/widgets/welcome_quiz_alert_dialog.dart';
import 'package:lines/repository/advices_service.dart';
import 'package:lines/repository/calendar_service.dart';
import 'package:lines/repository/product_service.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/tutorial_check_mark/src/target/target_content.dart';
import 'package:lines/tutorial_check_mark/src/target/target_focus.dart';
import 'package:lines/tutorial_check_mark/tutorial_coach_mark.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_controller.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeController extends AppScaffoldController {
  TutorialCoachMark? tutorialCoachMark;

  final RxInt tutorialStep = 0.obs;

  final RxBool rxShowGameTutorial = false.obs;

  final GlobalKey homeCircularPeriodCalendarKey = GlobalKey();
  final GlobalKey homeCircularPeriodAddButtonKey = GlobalKey();
  final GlobalKey missingMensesPrimaryButtonKey = GlobalKey();

  RxInt counter = 0.obs;
  bool updating = false;
  final scrollSnapListKey = GlobalKey<ScrollSnapListState>();

  void shouldShowSecondTutorial() {
    if (HiveManager.showSecondTutorialAccess) {
      HiveManager.showSecondTutorialAccess = false;

      // I show the tutorial if today is a menstruation day
      if (playButtonVisible) {
        rxShowGameTutorial.value = true;
        rxShowGameTutorial.refresh();
      }
    }
  }

  bool get isSelectedMestruationDay {
    if (currentPeriodDatesMap.values.toList().isEmpty) {
      return false;
    }

    final periodDate =
        currentPeriodDatesMap.values.toList()[periodSelectedDateIndex.value];
    return periodDate.periodPhase == PeriodPhase.menstruation;
  }

  bool get playButtonVisible {
    if (currentPeriodDatesMap.values.toList().isEmpty) {
      return false;
    }
    final periodDate =
        currentPeriodDatesMap.values.toList()[periodSelectedDateIndex.value];
    return periodDate.periodPhase == PeriodPhase.menstruation &&
        periodDate.date == formattedTodayDate;
  }

  RxInt periodSelectedDateIndex = 0.obs;

  Map<String, PeriodDate> get currentPeriodDatesMap =>
      appController.currentPeriod.value?.dates ?? {};

  /// Returns true if the user has saved some info about his period
  bool get hasSavedPeriodInfo => currentPeriodDatesMap.isNotEmpty;
  List<TargetFocus> targets = <TargetFocus>[];

  @override
  Future<void> onReady() async {
    super.onReady();

    ever(
      rxShowGameTutorial,
      condition: Get.currentRoute == Routes.main,
      (show) async {
        if (show) {
          rxShowGameTutorial.value = false;

          await wait(milliseconds: 800);

          // The Future.delayed is a workaround to ensure that
          // the homeCircularPeriodCalendarKey is in the correct position
          final RenderBox renderBox =
              homeCircularPeriodCalendarKey.currentContext?.findRenderObject()
                  as RenderBox;
          final size = renderBox.size;
          final position = renderBox.localToGlobal(Offset.zero);

          Future.delayed(
            const Duration(milliseconds: 1),
            () {
              List<TargetFocus> gameTargets = [];
              gameTargets.addAll(
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
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50,
                                    ),
                                    child: DisplayMedium(
                                      "Pronta a giocare?",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  ThemeSizedBox.height8,
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50,
                                    ),
                                    child: DisplaySmall(
                                      "Durante la fase mestruale puoi accedere all'ambiente di gioco e prenderti cura di me. ",
                                      textAlign: TextAlign.center,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
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
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );

              tutorialCoachMark = TutorialCoachMark(
                skipWidget: Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      Positioned(
                        left: position.dx + (size.width / 2) + 5,
                        top: position.dy + size.width + 10,
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset(
                            ThemeImage.tutorialTap,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      Positioned(
                        left: position.dx,
                        top: position.dy,
                        child: InkWell(
                          onTap: () async {
                            hideTutorial();
                            final sessionToken =
                                await SecureStorageManager().getToken();

                            Get.toNamed(
                              Routes.tamagochiWebView,
                              arguments: {
                                'sessionToken': sessionToken,
                              },
                            );
                          },
                          child: SizedBox(
                            height: size.width,
                            width: size.width,
                          ),
                        ),
                      ),
                      TutorialCloseButton(
                        onTap: () => hideTutorial(),
                      ),
                    ],
                  ),
                ),
                colorShadow: Colors.black,
                targets: gameTargets,
                opacityShadow: 0.8,
                paddingFocus: 10,
                pulseEnable: false,
              );
              showTutorial();
            },
          );
        }
      },
    );

    ever(
      appController.currentPeriod.rxValue,
      condition: () =>
          Get.currentRoute == Routes.main &&
          (!HiveManager.isFirstTutorialWatched),
      (callback) {
        if (callback.isSuccessful) {
          // The Future.delayed is a workaround to ensure that
          // the homeCircularPeriodCalendarKey is in the correct position
          Future.delayed(
            const Duration(milliseconds: 300),
            () {
              HiveManager.isFirstTutorialWatched = true;

              // The first tutorial has been seen, next time I'll show the second tutorial
              HiveManager.showSecondTutorialAccess = true;

              /// Tutorial without Droppy
              if (!hasSavedPeriodInfo) {
                targets.add(
                  TargetFocus(
                    radius: 1,
                    identify: "missingMensesPrimaryButtonKey",
                    keyTarget: missingMensesPrimaryButtonKey,
                    contents: [
                      TargetContent(
                        align: ContentAlign.top,
                        padding: EdgeInsets.zero,
                        builder: (context, controller) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 50,
                                    ),
                                    child: DisplayMedium(
                                      "Aggiungi le tue mestruazioni per scoprire Cherry",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  ThemeSizedBox.height90,
                                  ThemeSizedBox.height32,
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              }

              /// Tutorial with red Droppy
              if (hasSavedPeriodInfo) {
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
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
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
              }
              if (!hasSavedPeriodInfo) {
                final RenderBox renderBox = homeCircularPeriodAddButtonKey
                    .currentContext
                    ?.findRenderObject() as RenderBox;
                final size = renderBox.size;
                final position = renderBox.localToGlobal(Offset.zero);

                tutorialCoachMark = TutorialCoachMark(
                  skipWidget: Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Positioned(
                          left: position.dx,
                          top: position.dy,
                          width: size.width + 8,
                          height: size.height,
                          child: PrimaryButton(
                            buttonSize: ButtonSize.h31,
                            onPressed: () {
                              hideTutorial();
                              Get.toNamed(Routes.calendar);
                            },
                            child: const TitleSmall(
                              "Aggiungi mestruazioni",
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                        TutorialCloseButton(
                          onTap: () => hideTutorial(),
                        ),
                      ],
                    ),
                  ),
                  colorShadow: Colors.black,
                  targets: targets,
                  opacityShadow: 0.8,
                  paddingFocus: 10,
                  pulseEnable: false,
                );
              }
              if (hasSavedPeriodInfo) {
                final RenderBox renderBox = homeCircularPeriodCalendarKey
                    .currentContext
                    ?.findRenderObject() as RenderBox;
                final size = renderBox.size;
                final position = renderBox.localToGlobal(Offset.zero);

                tutorialCoachMark = TutorialCoachMark(
                  skipWidget: Obx(
                    () {
                      if (tutorialStep.value == 0) {
                        return Stack(
                          children: [
                            SafeArea(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: TutorialContinueButton(
                                  goToNextTutorial: goToNextTutorial,
                                ),
                              ),
                            ),
                            // TutorialCloseButton(
                            //   onTap: () => hideTutorial(),
                            // ),
                          ],
                        );
                      } else if (tutorialStep.value == 1) {
                        return Stack(
                          children: [
                            SafeArea(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: MensesPhaseCard(
                                  goToNextTutorial: goToNextTutorial,
                                ),
                              ),
                            ),
                            // TutorialCloseButton(
                            //   onTap: () => hideTutorial(),
                            // ),
                          ],
                        );
                      }
                      return Stack(
                        children: [
                          Positioned(
                            left: position.dx,
                            top: position.dy,
                            child: InkWell(
                              onTap: () async {
                                hideTutorial();
                                final sessionToken =
                                    await SecureStorageManager().getToken();

                                Get.toNamed(
                                  Routes.customizeCherryWebView,
                                  arguments: {
                                    'sessionToken': sessionToken,
                                  },
                                );
                              },
                              child: SizedBox(
                                height: size.width,
                                width: size.width,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  colorShadow: Colors.black,
                  targets: targets,
                  opacityShadow: 0.8,
                  paddingFocus: 10,
                  pulseEnable: false,
                );
              }

              showTutorial();
            },
          );
        }
      },
    );

    if (!appController.missions.responseHandler.isSuccessful) {
      await ProductService.mission;
    }
    if (!appController.advicesCategories.responseHandler.isSuccessful) {
      await AdvicesService.fetchSuggestedArticles();
    }

    await CalendarService.fetchCalendarData();
    scrollCalendarToToday();

    if (HiveManager.showSurveyTutorial) {
      HiveManager.showSurveyTutorial = false;

      showErrorDialog(
        context: Get.context!,
        builder: (_) {
          return WelcomeQuizAlertDialog();
        },
      );
    }
  }

  void scrollCalendarToToday() async {
    periodSelectedDateIndex.value = await _initCalendars();
    scrollSnapListKey.currentState?.focusToItem(periodSelectedDateIndex.value);
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

  Rx<DateTime> get selectedDate {
    return DateTime.now().obs;
  }

  String get formattedTodayDate => dateFormatYMD.format(DateTime.now());

  Future<int> _initCalendars() async {
    if (!appController.currentPeriod.responseHandler.isSuccessful) {
      await CalendarService.fetchCurrentPeriod();
    }
    await CalendarService.fetchCalendarData();

    int result =
        currentPeriodDatesMap.keys.toList().indexOf(formattedTodayDate);
    if (result < 0) {
      return currentPeriodDatesMap.keys.toList().length;
    }
    return result;
  }

  bool get showWelcomeQuizSection =>
      appController.user.value?.isWelcomeQuizCompleted == false;

  List<AdvicesArticle> get allSuggestedArticles =>
      appController.suggestedAdvicesArticle.value ?? [];

  RxBool get showSuggestedArticlesSection =>
      allSuggestedArticles.isNotEmpty.obs;

  bool get showMissionSection =>
      appController.missions.value?.isNotEmpty == true;

  void showArticleDetails(AdvicesArticle article, AdvicesCategory category) {
    Get.toNamed(
      Routes.articleDetailPage,
      arguments: AdvicesDetailPair(
        category: category,
        article: article,
      ),
    );
  }
}
