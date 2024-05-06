import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/info/controller/info_dropdown_result_controller.dart';
import 'package:lines/modules/info/widgets/info_dropdown.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class InfoDropDownResultsPage extends GetView<InfoDropdownResultController> {
  const InfoDropDownResultsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: const TransparentAppBar(
        backButtonColor: ThemeColor.darkBlue,
        title: TitleMedium(
          "INFO",
          color: ThemeColor.darkBlue,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          const DisplayMedium(
            "Quanti coins valgono\n i prodotti?",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height32,
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.productCategories.length,
            itemBuilder: (context, index) {
              return InfoDropDown(
                category: controller.productCategories[index],
              );
            },
            separatorBuilder: (context, index) => ThemeSizedBox.height16,
          ),
          ThemeSizedBox.height48,
        ],
      ),
    );
  }
}
