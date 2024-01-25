import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';

import '../../../core/utils/helpers.dart';
import '../../../widgets/layouts/scrollable_appbar.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollableAppBar(
      leftWidget: _menuButton(),
      rightWidget: _rightWidget(),
      scrollController: ScrollController(),
    );
  }

  Widget _calendar() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: SizedBox(
        height: 44,
        width: 44,
        child: SvgPicture.asset(
          ThemeIcon.calendar,
          fit: BoxFit.scaleDown,
          height: 24,
        ),
      ),
    );
  }

  Widget _menuButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: InkWell(
        onTap: () => logTodo("Menu"),
        child: SizedBox(
          height: 44,
          width: 44,
          child: SvgPicture.asset(
            ThemeIcon.menu,
            fit: BoxFit.scaleDown,
            height: 24,
          ),
        ),
      ),
    );
  }

  Widget _rightWidget() {
    BuildContext? context = Get.context;
    return Row(
      children: [
        // TextGradient(
        //   text: Text(
        //     'Calendario',
        //     style: ThemeTextStyle.calendarMonth,
        //   ),
        // ),
        const HeadlineSmall('Calendario').applyShaders(context!),
        _calendar(),
      ],
    );
  }
}
