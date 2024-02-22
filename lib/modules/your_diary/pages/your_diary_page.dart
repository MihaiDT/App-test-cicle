import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/modules/your_diary/widgets/category_symptom_tile.dart';
import 'package:lines/modules/your_diary/your_diary_controller.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';

class YourDiaryPage extends GetView<YourDiaryController> {
  const YourDiaryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TransparentAppBar(
        title: TitleSmall(
          "GRAFICI E STATISTICHE",
          color: ThemeColor.darkBlue,
        ),
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: Column(
        children: [
          ThemeSizedBox.height16,
          const DisplayMedium(
            "Il tuo diario",
            textAlign: TextAlign.center,
          ).applyShaders(context),
          ThemeSizedBox.height16,
          Divider(
            color: ThemeColor.lightGrey,
            thickness: 1,
            indent: ThemeSize.paddingSmall,
            endIndent: ThemeSize.paddingSmall,
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                horizontal: ThemeSize.paddingSmall,
              ),
              itemBuilder: (context, index) {
                return CategorySymptomTile(
                  imagePath: controller.list[index].categoryIconPath,
                  title: controller.list[index].categoryTitle,
                );
              },
              separatorBuilder: (context, index) => _divider,
              itemCount: controller.list.length,
            ),
          ),
          Divider(
            color: ThemeColor.lightGrey,
            thickness: 1,
            indent: ThemeSize.paddingSmall,
            endIndent: ThemeSize.paddingSmall,
          ),
        ],
      ),
    );
  }

  Widget get _divider => Divider(
        color: ThemeColor.lightGrey,
        thickness: 1,
      );
}
