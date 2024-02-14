import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getIcon(context),
        const DisplayLarge(
          "PROFILO",
          color: ThemeColor.primary,
        ),
        // This is a hidden widget used to maintain the centered position of the title
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: false,
          child: getIcon(context),
        ),
      ],
    );
  }

  Widget getIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: SvgPicture.asset(
        ThemeIcon.menu,
      ),
    );
  }
}
