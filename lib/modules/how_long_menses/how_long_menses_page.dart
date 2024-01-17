import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/modules/how_long_menses/widget/how_often_menses_widget.dart';
import 'package:lines/modules/how_long_menses/widget/menses_duration_counter_widget.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/secondary_button.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class HowLongMensesPage extends StatefulWidget {
  const HowLongMensesPage({super.key});

  @override
  State<HowLongMensesPage> createState() => _HowLongMensesPageState();
}

class _HowLongMensesPageState extends State<HowLongMensesPage> {
  int mensesDuration = 1;
  int howOftenMensesValue = 26;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundImage: ThemeDecoration.images.bgDark,
      extendBodyBehindAppBar: true,
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "CONOSCIAMOCI",
        ),
      ),
      body: BottomWidgetLayout(
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
              SecondaryButton(
                text: "AVANTI",
                onPressed: () {},
              ),
              ThemeSizedBox.height16,
              GestureDetector(
                onTap: () {},
                child: const TitleMedium(
                  "NON LO SO",
                  underline: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: Get.statusBarHeight,
            ),
            const DisplayMedium(
              "Quanto durano in media le tue mestruazioni?",
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height32,
            MensesDurationCounterWidget(
              onTap: (value) {
                mensesDuration = value;
              },
            ),
            ThemeSizedBox.height32,
            const Divider(),
            ThemeSizedBox.height32,
            const DisplayMedium(
              "Di solito, ogni quanti giorni ti arrivano le mestruazioni?",
            ),
            ThemeSizedBox.height32,
            HowOftenMensesWidget(
              onTap: (value) {
                howOftenMensesValue = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
