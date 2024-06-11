import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/core/helpers/piwik_manager.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TransparentAppBar(
      leading: InkWell(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Center(
          child: SizedBox(
            height: 24,
            width: 24,
            child: SvgPicture.asset(
              ThemeIcon.menu,
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            PiwikManager.trackEvent(
              PiwikEventType.profile,
              action: 'view calendar',
            );

            Get.toNamed(Routes.calendar);
          },
          child: Row(
            children: [
              const HeadlineSmall(
                'Calendario',
              ).applyShaders(context),
              ThemeSizedBox.width4,
              SvgPicture.asset(
                ThemeIcon.calendar,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
