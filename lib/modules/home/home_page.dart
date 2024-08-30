import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/advices/widgets/advices_cards_row.dart';
import 'package:lines/modules/home/home_controller.dart';
import 'package:lines/modules/home/widgets/cherry_home_box.dart';
import 'package:lines/modules/home/widgets/circular_period/home_circular_period_calendar.dart';
import 'package:lines/modules/home/widgets/circular_period/home_circular_period_calendar_shimmer.dart';
import 'package:lines/modules/home/widgets/header_section.dart';
import 'package:lines/modules/home/widgets/home_period_info/home_period_info.dart';
import 'package:lines/modules/home/widgets/home_period_info/home_period_info_shimmer.dart';
import 'package:lines/modules/home/widgets/horizontal_calendar/home_horizontal_calendar.dart';
import 'package:lines/modules/home/widgets/mission_row_section.dart';
import 'package:lines/modules/home/widgets/welcome_quiz_section/welcome_quiz_section.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/buttons/primary_button.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    controller.shouldShowSecondTutorial();

    return Column(
      children: [
        const HeaderSection(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Obx(
                () {
                  final currentPeriod =
                      appController.currentPeriod.responseHandler;
                  final user = appController.user.responseHandler;
                  return (currentPeriod.isPending || currentPeriod.isInitial) ||
                          (user.isPending || user.isInitial)
                      ? const HomeCircularPeriodCalendarShimmer()
                      : const Column(
                          children: [
                            HomeHorizontalCalendar(),
                            SizedBox(height: 4.5),
                            HomeCircularPeriodCalendar(),
                          ],
                        );
                },
              ),
              ThemeSizedBox.height4,
              Obx(
                () => controller.isSelectedMestruationDay
                    ? Align(
                        alignment: Alignment.center,
                        child: IntrinsicWidth(
                          child: PrimaryButton(
                            onPressed: () => Get.toNamed(Routes.calendar),
                            buttonSize: ButtonSize.h31,
                            child: const Text(
                              "Modifica mestruazioni",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.1,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              ThemeSizedBox.height16,
              Obx(
                () {
                  final currentPeriod =
                      appController.currentPeriod.responseHandler;
                  final user = appController.user.responseHandler;
                  return (currentPeriod.isPending || currentPeriod.isInitial) ||
                          (user.isPending || user.isInitial)
                      ? const HomePeriodInfoShimmer()
                      : const HomePeriodInfo();
                },
              ),
              ThemeSizedBox.height16,
              const CherryHomeBox(),
              Obx(
                () => (controller.showWelcomeQuizSection)
                    ? Column(
                        children: [
                          ThemeSizedBox.height32,
                          const WelcomeQuizSection(),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              Obx(
                () => (controller.showMissionSection)
                    ? Column(
                        children: [
                          ThemeSizedBox.height32,
                          const MissionRowSection(),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              Obx(
                () => controller.showSuggestedArticlesSection.value
                    ? Column(
                        children: [
                          ThemeSizedBox.height32,
                          const Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TitleMedium(
                                'CONTENUTI PER TE',
                                color: ThemeColor.darkBlue,
                                letterSpacing: 2,
                              ),
                            ),
                          ),
                          ThemeSizedBox.height16,
                          SizedBox(
                            height: 220,
                            child: AdvicesCardsRow(
                              onCardTapped: (article, category) => controller
                                  .showArticleDetails(article, category),
                              withBorder: true,
                              articles: controller.allSuggestedArticles,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              ThemeSizedBox.height40,
            ],
          ),
        ),
      ],
    );
  }
}
