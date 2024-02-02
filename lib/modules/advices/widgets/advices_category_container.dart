import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/enums/advices_category.dart';

class AdvicesCategoryContainer extends StatelessWidget {
  final AdvicesCategory advicesCategory;

  const AdvicesCategoryContainer({required this.advicesCategory, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: Colors.black.withOpacity(0.3),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: HeadlineMedium(
                    advicesCategory.categoryTitle.toUpperCase(),
                    fontWeight: FontWeight.w900,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
