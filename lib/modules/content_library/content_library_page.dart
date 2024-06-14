import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/content_library/controllers/content_library_controller.dart';
import 'package:lines/modules/content_library/tabs/categories_tab.dart';
import 'package:lines/modules/content_library/tabs/content_library_for_you_tab.dart';
import 'package:lines/modules/content_library/tabs/content_library_saved_tab.dart';
import 'package:lines/routes/routes.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/underline_tab_bar.dart';

class ContentLibraryPage extends GetView<ContentLibraryController> {
  const ContentLibraryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: const TitleMedium(
          'LIBRERIA CONTENUTI',
          color: ThemeColor.darkBlue,
          fontWeight: ThemeTextStyle.weightSemibold,
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.contentLibrarySearchPage);
            },
            child: SvgPicture.asset(ThemeIcon.search),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Obx(
        () {
          return UnderlinedTabBar(
            tabController: controller.tabController,
            tabs: pageTabs(
              context,
              controller.selectedIndex.value,
            ),
            onTap: (value) {
              controller.selectedIndex.value = value;
            },
            pages: const [
              ContentLibraryForYouTab(),
              CategoriesTab(),
              ContentLibrarySavedArticleTab(),
            ],
          );
        },
      ),
    );
  }

  List<Tab> pageTabs(
    BuildContext context,
    int selectedIndex,
  ) {
    /// Get the width of the screen and subtract some padding
    final double width = MediaQuery.of(context).size.width - 160;

    return [
      Tab(
        child: SizedBox(
          width: width / 3,
          child: Center(
            child: HeadlineMedium(
              'Per te',
              color: selectedIndex == 0
                  ? ThemeColor.brightPink
                  : ThemeColor.darkBlue,
            ),
          ),
        ),
      ),
      Tab(
        child: SizedBox(
          width: width / 3,
          child: Center(
            child: HeadlineMedium(
              'Categorie',
              color: selectedIndex == 1
                  ? ThemeColor.brightPink
                  : ThemeColor.darkBlue,
            ),
          ),
        ),
      ),
      Tab(
        child: SizedBox(
          width: width / 3,
          child: Row(
            children: [
              SvgPicture.asset(
                ThemeIcon.savedEmpty,
                color: selectedIndex == 2
                    ? ThemeColor.brightPink
                    : ThemeColor.darkBlue,
              ),
              HeadlineMedium(
                'Salvati',
                color: selectedIndex == 2
                    ? ThemeColor.brightPink
                    : ThemeColor.darkBlue,
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
