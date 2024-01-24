import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_decoration.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/modules/last_menses/widget/horizontal_range_calendar.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class LastMensesPage extends StatefulWidget {
  const LastMensesPage({super.key});

  @override
  State<LastMensesPage> createState() => _LastMensesPageState();
}

class _LastMensesPageState extends State<LastMensesPage> {
  ValueNotifier<DateTimeRange?> datetimeRange = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(
        title: HeadlineMedium(
          "PARLACI DEL TUO CICLO",
        ),
      ),
      body: SafeArea(
        child: BottomWidgetLayout(
          scrollableAreaPadding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingLarge,
          ),
          bottomWidget: Padding(
            padding: const EdgeInsets.only(
              left: ThemeSize.paddingLarge,
              right: ThemeSize.paddingLarge,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ValueListenableBuilder(
                  valueListenable: datetimeRange,
                  builder: (_, DateTimeRange? value, __) {
                    return SecondaryButton(
                      text: "AVANTI",
                      onPressed: value == null
                          ? null
                          : () {
                              Get.toNamed(Routes.howLongMensesPage);
                            },
                    );
                  },
                ),
                ThemeSizedBox.height16,
                GestureDetector(
                  onTap: () {},
                  child: const TitleMedium(
                    "NON ME LO RICORDO",
                    underline: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          child: Column(
            children: [
              ThemeSizedBox.height60,
              const DisplayMedium(
                "Quando hai avuto\n le ultime mestruazioni?",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height16,
              const BodyMedium(
                "Indica la data di inizio e fine\n delle tue mestruazioni",
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height32,
              HorizontalRangeCalendar(
                onRangeSelected: (selectedRange) {
                  datetimeRange.value = selectedRange;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
