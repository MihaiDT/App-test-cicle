import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_size.dart';
import 'package:lines/core/utils/singletons.dart';
import 'package:lines/modules/cookies_fingerprinting/cookies_fingerprinting_controller.dart';

import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/bottom_widget_layout.dart';

class CookiesFingerprintingPage extends GetView<CookiesFingerprintingController> {
  const CookiesFingerprintingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "INFORMATIVA TRACCIATORI",
          color: ThemeColor.darkBlue,
        ),
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: SafeArea(
        child: BottomWidgetLayout(
          scrollableAreaPadding: const EdgeInsets.symmetric(
            horizontal: ThemeSize.paddingSmall,
          ),
          bottomWidget: const SizedBox.shrink(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ThemeSize.paddingSmall,
            ),
            child: Html(
              data: appController.settings.value?.cookieFingerprintingContent ?? '',
              style: {
                "a": Style(
                  color: ThemeColor.darkBlue,
                  fontSize: FontSize(14),
                  fontWeight: FontWeight.w400,
                ),
                "body": Style(
                  color: ThemeColor.darkBlue,
                  fontSize: FontSize(14),
                  fontWeight: FontWeight.w400,
                ),
                "h2": Style(
                  color: ThemeColor.darkBlue,
                  fontSize: FontSize(16),
                  fontWeight: FontWeight.w600,
                  margin: Margins.only(
                    bottom: 16,
                    top: 32,
                  ),
                ),
              },
            ),
          ),
        ),
      ),
    );
  }
}
