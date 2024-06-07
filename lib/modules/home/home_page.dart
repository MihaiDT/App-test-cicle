import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/advices/widgets/advices_cards_row.dart';
import 'package:lines/modules/home/home_controller.dart';
import 'package:lines/modules/home/widgets/circular_period/home_circular_period_calendar.dart';
import 'package:lines/modules/home/widgets/circular_period/home_circular_period_calendar_shimmer.dart';
import 'package:lines/modules/home/widgets/header_section.dart';
import 'package:lines/modules/home/widgets/home_period_info/home_period_info.dart';
import 'package:lines/modules/home/widgets/home_period_info/home_period_info_shimmer.dart';
import 'package:lines/modules/home/widgets/horizontal_calendar/home_horizontal_calendar.dart';
import 'package:lines/modules/home/widgets/horizontal_calendar/home_horizontal_calendar_shimmer.dart';
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
    return Column(
      children: [
        const HeaderSection(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Obx(
                () => appController.currentPeriod.responseHandler.isPending ||
                        appController.user.responseHandler.isPending
                    ? const HomeHorizontalCalendarShimmer()
                    : const HomeHorizontalCalendar(),
              ),
              Obx(
                () => appController.currentPeriod.responseHandler.isPending ||
                        appController.user.responseHandler.isPending
                    ? const HomeCircularPeriodCalendarShimmer()
                    : const Padding(
                        padding: EdgeInsets.only(top: 4.5),
                        child: HomeCircularPeriodCalendar(),
                      ),
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
                            child: const TitleLarge("Modifica mestruazioni"),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              ThemeSizedBox.height16,
              Obx(
                () => appController.currentPeriod.responseHandler.isPending ||
                        appController.user.responseHandler.isPending
                    ? const HomePeriodInfoShimmer()
                    : const HomePeriodInfo(),
              ),
              if (controller.showWelcomeQuizSection) ...[
                ThemeSizedBox.height32,
                const WelcomeQuizSection(),
              ],
              Obx(
                () {
                  if (controller.showMissionSection) {
                    return Column(
                      children: [
                        ThemeSizedBox.height32,
                        const MissionRowSection(),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              Obx(() {
                if (controller.showSuggestedArticlesSection.value) {
                  return Column(
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
                          onCardTapped: (article, category) =>
                              controller.showArticleDetails(article, category),
                          withBorder: true,
                          articles: controller.allSuggestedArticles,
                        ),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              }),
              ThemeSizedBox.height90,
            ],
          ),
        ),
      ],
    );
  }
}
