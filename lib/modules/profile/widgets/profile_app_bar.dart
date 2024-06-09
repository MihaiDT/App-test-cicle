import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TransparentAppBar(
      leading: getIcon(context),
      title: const DisplayLarge(
        "Profilo",
        color: ThemeColor.primary,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    );
  }

  Widget getIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).openDrawer();
      },
      child: Center(
        child: SvgPicture.asset(
          height: 24,
          width: 24,
          ThemeIcon.menu,
          color: ThemeColor.darkBlue,
        ),
      ),
    );
  }
}
