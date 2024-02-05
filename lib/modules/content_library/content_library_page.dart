import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/content_library/content_library_controller.dart';
import 'package:lines/modules/content_library/tabs/content_library_for_you_tab.dart';
import 'package:lines/modules/content_library/widgets/tab_indicator.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class ContentLibrayPage extends StatelessWidget {
  ContentLibraryController controller = Get.put(ContentLibraryController());

  ContentLibrayPage({super.key});

  final List<Tab> pageTabs = <Tab>[
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
              //TODO: add on tap callback
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
                  Center(
                    child: Text('Come'),
                  ),
                  Center(
                    child: Text('Stai'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
