import 'package:flutter/material.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/buttons/primary_button.dart';
import 'package:lines/widgets/expandable/expandable.dart';

import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({
    super.key,
  });

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "ASSISTENZA",
          color: ThemeColor.primary,
        ),
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: BottomWidgetLayout(
        scrollableAreaPadding: const EdgeInsets.symmetric(
          horizontal: ThemeSize.paddingSmall,
        ),
        bottomWidget: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingSmall,
          ),
          child: PrimaryButton(
            onPressed: () {},
            child: const TitleLarge("Contattaci"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DisplayMedium(
              "Domande più frequenti",
            ).applyShaders(context),
            ThemeSizedBox.height16,
            const Expandable(
              title: "Domanda 1Domanda 1Domanda 1Domanda 1Domanda 1Domanda 1",
              child: Text(
                "Lorem ipsum dolor sit amet consectetur. Elit sit vehicula adipiscing magna ac odio commodo. Pulvinar velit lobortis pharetra tristique dignissim urna diam felis. Ipsum sit praesent aliquam vitae commodo bibendum. Diam nec diam nec egestas et tortor.",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
