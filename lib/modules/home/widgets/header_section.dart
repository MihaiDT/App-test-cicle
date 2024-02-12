import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ThemeSizedBox.width24,
        GestureDetector(
          onTap: () {
            print("object");
            Scaffold.of(context).openDrawer();
          },
          child: SvgPicture.asset(
            ThemeIcon.menu,
          ),
        ),
        const Spacer(),
        const HeadlineSmall('Calendario').applyShaders(context),
        ThemeSizedBox.width4,
        SvgPicture.asset(
          ThemeIcon.calendar,
        ),
        ThemeSizedBox.width24,
      ],
    );
  }
}
