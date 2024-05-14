import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/advices/controllers/advices_controller.dart';
import 'package:lines/modules/advices/widgets/advices_cards_row.dart';
import 'package:lines/modules/advices/widgets/advices_content_library_button.dart';
import 'package:lines/modules/advices/widgets/advices_gynecologist_box.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class AdvicesPage extends GetView<AdvicesController> {
  const AdvicesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.pageShouldRefresh) {
          return Column(
            children: [
              TransparentAppBar(
                title: const DisplayLarge(
                  'Consigli',
                  color: ThemeColor.primary,
                ),
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
                        color: ThemeColor.darkBlue,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(
                    bottom: 200,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: const DisplayMedium(
                          'Contenuti per te',
                        ).applyShaders(context),
                      ),
                    ),
                    ThemeSizedBox.height16,
                    SizedBox(
                      height: 220,
                      child: AdvicesCardsRow(
                        onCardTapped: controller.showArticleDetails,
                        withBorder: true,
                        articles: controller.getAllArticles,
                      ),
                    ),
                    ThemeSizedBox.height8,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: AdvicesContentLibraryButton(),
                    ),
                    ThemeSizedBox.height40,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: AdvicesGynecologistBox(),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
