import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/badges/controllers/badges_controller.dart';
import 'package:lines/badges/pages/completed_badges_page.dart';
import 'package:lines/badges/pages/in_progress_badges_page.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import 'package:lines/widgets/layouts/underline_tab_bar.dart';

class BadgesPage extends GetView<BadgesController> {
  const BadgesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "MODIFICA PROFILO",
          color: ThemeColor.darkBlue,
        ),
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: UnderlinedTabBar(
        tabController: controller.tabController,
        tabs: controller.tabs,
        pages: const [
          InProgressBadgePage(),
          CompletedBadgesPage(),
        ],
      ),
    );
  }
}
