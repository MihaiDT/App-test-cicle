import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app_theme.dart';
import '../../widgets/layouts/app_scaffold_page.dart';
import '../home/home_page.dart';
import 'main_controller.dart';
import 'widgets/main_app_bar.dart';
import 'widgets/main_bottom_navigation_bar.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AppScaffoldPage(
        backgroundImage: ThemeDecoration.images.bgLight,
        bottomNavigationBar: const MainBottomNavigationBar(),
        extendBodyBehindAppBar: false,
        scrollController: ScrollController(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const MainAppBar(),
            IndexedStack(
              index: controller.tabIndex,
              children: const [
                HomePage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
