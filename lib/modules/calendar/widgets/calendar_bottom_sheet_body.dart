import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/text_wrapper.dart';
import '../../../core/theme/theme_color.dart';
import '../../../core/theme/theme_gradient.dart';
import '../../../core/theme/theme_icon.dart';
import '../../../core/theme/theme_sized_box.dart';
import '../../../data/models/symptom_category.dart';
import '../../../widgets/dividers/divider_with_gradient.dart';
import 'calendar_bottom_sheet_row.dart';

class CalendarBottomSheetBody extends StatelessWidget {
  final List<SymptomCategory> categories;
  final Function(int, int)? onSymptomTap;

  const CalendarBottomSheetBody({
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
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: ThemeGradient.primary,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: SvgPicture.asset(ThemeIcon.checkMark),
                          ),
                        ),
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
              CalendarBottomSheetRow(
                categoryIndex: categoryIndex,
                onSymptomTap: onSymptomTap,
                symptomList: categories[categoryIndex].symptoms,
              )
            ],
          ),
        ),
      ),
    );
  }
}
