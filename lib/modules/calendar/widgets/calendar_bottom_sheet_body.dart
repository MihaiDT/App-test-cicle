import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lines/modules/calendar/calendar_controller.dart';
import 'package:lines/widgets/buttons/app_round_button.dart';
import 'package:lines/core/theme/text_wrapper.dart';
import 'package:lines/core/theme/theme_color.dart';
import 'package:lines/core/theme/theme_gradient.dart';
import 'package:lines/core/theme/theme_icon.dart';
import 'package:lines/core/theme/theme_sized_box.dart';
import 'package:lines/data/models/symptom_category.dart';
import 'package:lines/widgets/dividers/divider_with_gradient.dart';
import 'package:lines/modules/calendar/widgets/calendar_bottom_sheet_row.dart';

class CalendarBottomSheetBody extends StatelessWidget {
  final List<SymptomCategory> categories;
  final Function(int, int)? onSymptomTap;
  final CalendarController controller = Get.put(CalendarController());

  CalendarBottomSheetBody({
    required this.categories,
    this.onSymptomTap,
    super.key,
  });

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
                      categories[categoryIndex].categoryIconPath,
                    ),
                    ThemeSizedBox.width16,
                    TitleMedium(
                      categories[categoryIndex].categoryTitle.toUpperCase(),
                      color: ThemeColor.brightPink,
                    ),
                    const Spacer(),
                    const BodySmall(
                      'Aggiungi in home',
                      color: ThemeColor.darkBlue,
                    ),
                    ThemeSizedBox.width6,
                    Obx(
                      () => AppRoundButton(
                        radius: 6,
                        iconPath: ThemeIcon.checkMark,
                        onChanged: (value) {
                          controller.symptomCategoryController.onValueChanged(
                            categories[categoryIndex].categoryTitle,
                            value,
                            categoryIndex,
                          );
                        },
                        value: controller
                            .symptomCategoryController
                            .calendarStore
                            .currentCategories[categoryIndex]
                            .inHome,
                      ),
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
              Obx(
                () {
                  return Visibility(
                    visible: categories.isNotEmpty,
                    child: CalendarBottomSheetRow(
                      categoryIndex: categoryIndex,
                      onSymptomTap: onSymptomTap,
                      symptomList: categories[categoryIndex].symptoms,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
