import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';

import '../../../data/models/advices_category.dart';

class AdvicesCategoryContainer extends StatelessWidget {
  final AdvicesCategory advicesCategory;
  final Function(AdvicesCategory)? onCategoryTapped;

  const AdvicesCategoryContainer({
    required this.advicesCategory,
    this.onCategoryTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCategoryTapped?.call(advicesCategory),
      child: Container(
        decoration: BoxDecoration(
          color: advicesCategory.categoryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            SvgPicture.asset(
              advicesCategory.iconPath,
              width: 53,
              height: 53,
              color: Colors.black.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        advicesCategory.iconPath,
                        color: advicesCategory.categoryColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: HeadlineMedium(
                      advicesCategory.categoryTitle != null
                          ? advicesCategory.categoryTitle!.toUpperCase()
                          : "",
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
