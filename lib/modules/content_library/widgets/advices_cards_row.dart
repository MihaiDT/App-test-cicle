import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_theme.dart';
import '../../../data/enums/advices_category.dart';
import '../../advices/widgets/advice_card.dart';

class AdvicesCardsRow extends StatelessWidget {
  final AdvicesCategory category;

  const AdvicesCardsRow({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                category.iconPath,
                color: category.categoryColor,
              ),
              TitleMedium(
                category.categoryTitle.toUpperCase(),
                color: ThemeColor.darkBlue,
              ),
            ],
          ),
        ),
        ThemeSizedBox.height4,
        SizedBox(
          height: 220,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) {
              if (index > 0) {
                return ThemeSizedBox.width8;
              } else {
                return const SizedBox.shrink();
              }
            },
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            //TODO: fixed for ui testing purpose , change to dynamic approach later
            itemCount: 8,
            itemBuilder: (context, index) {
              if (index == 0) {
                return ThemeSizedBox.width16;
              }
              return SizedBox(
                width: 150,
                child: AdviceCard(
                    advicesCategory: AdvicesCategory.ginecologia,
                    text: 'Ovuli e lavande vaginali: questi sconosciuti'),
              );
            },
          ),
        )
      ],
    );
  }
}
