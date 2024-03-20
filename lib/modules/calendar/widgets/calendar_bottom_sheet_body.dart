import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_gradient.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/data/isar/symptom_category.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet_row.dart';
import 'package:lines/widgets/dividers/divider_with_gradient.dart';

class CalendarBottomSheetBody extends GetView<CalendarController> {
  const CalendarBottomSheetBody({super.key});

  List<SymptomCategory> get categories => SymptomCategory.findAll();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        categories.length,
        (categoryIndex) => Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      categories[categoryIndex].iconPath,
                    ),
                    ThemeSizedBox.width16,
                    TitleMedium(
                      categories[categoryIndex].name.toUpperCase(),
                      color: ThemeColor.brightPink,
                    ),
                  ],
                ),
              ),
              ThemeSizedBox.height8,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DividerWithGradient(gradient: ThemeGradient.primary),
              ),
              ThemeSizedBox.height16,
              CalendarBottomSheetRow(
                categoryIndex: categoryIndex,
                category: categories[categoryIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
