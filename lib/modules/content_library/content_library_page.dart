import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:lines/modules/content_library/tabs/categories_tab.dart';
import 'package:lines/modules/content_library/tabs/content_library_for_you_tab.dart';
import 'package:lines/modules/content_library/tabs/content_library_saved_tab.dart';
import 'package:lines/modules/content_library/widgets/tab_indicator.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';
import '../../core/app_theme.dart';

import 'controllers/content_library_controller.dart';

class ContentLibraryPage extends GetView<ContentLibraryController> {
  const ContentLibraryPage({super.key});

  List<Tab> get pageTabs => <Tab>[
        const Tab(
          text: 'Per te',
        ),
        const Tab(
          text: 'Categorie',
        ),
        Tab(
          child: Row(
            children: [
              SvgPicture.asset(
                ThemeIcon.savedEmpty,
                color: ThemeColor.darkBlue,
              ),
              const Text('Salvati'),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: const TitleMedium(
          'LIBRERIA CONTENUTI',
          color: ThemeColor.darkBlue,
          fontWeight: NewThemeTextStyle.weightSemibold,
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.contentLibrarySearchPage);
            },
            child: SvgPicture.asset(ThemeIcon.search),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              labelStyle: NewThemeTextStyle.headlineMedium,
              unselectedLabelColor: ThemeColor.darkBlue,
              labelColor: ThemeColor.brightPink,
              controller: controller.tabController,
              tabs: pageTabs,
              indicator: TabIndicator(
                color: ThemeColor.brightPink,
                radius: 5,
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: const [
                  ContentLibraryForYouTab(),
                  CategoriesTab(),
                  ContentLibrarySavedArticleTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
