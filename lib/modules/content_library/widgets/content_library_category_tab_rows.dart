import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme.dart';
import '../../../data/enums/advices_category.dart';
import '../../advices/widgets/advices_cards_row.dart';

class ContentLibraryCategoryTabRows extends StatelessWidget {
  const ContentLibraryCategoryTabRows({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => ThemeSizedBox.height32,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: AdvicesCategory.values.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AdvicesCategory.values[index].iconPath,
                    color: AdvicesCategory.values[index].categoryColor,
                  ),
                  TitleMedium(
                    AdvicesCategory.values[index].categoryTitle.toUpperCase(),
                    color: ThemeColor.darkBlue,
                  ),
                ],
              ),
            ),
            ThemeSizedBox.height4,
            const SizedBox(
              height: 220,
              child: AdvicesCardsRow(
                articles: [],
              ),
            ),
          ],
        );
      },
    );
  }
}
