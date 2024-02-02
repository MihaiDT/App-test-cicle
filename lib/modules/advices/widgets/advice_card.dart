import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/data/enums/advices_category.dart';

import '../../../core/theme/text_wrapper.dart';
import '../../../core/theme/theme_color.dart';
import '../../../core/theme/theme_icon.dart';
import '../../../core/theme/theme_sized_box.dart';
import 'advice_card_save_button.dart';

class AdviceCard extends StatelessWidget {
  final AdvicesCategory advicesCategory;
  final bool isNew;
  final bool isSaved;
  final String text;
  final Function(bool)? onSaveTap;
  final String? imageUrl;
  final bool hasBorder;
  late final String? timer;
  late final bool gallery;

  AdviceCard({
    required this.advicesCategory,
    this.imageUrl,
    this.hasBorder = false,
    this.isNew = false,
    this.isSaved = false,
    this.onSaveTap,
    required this.text,
    super.key,
  }) {
    timer = null;
    gallery = false;
  }

  AdviceCard.withTimer({
    required this.timer,
    required this.advicesCategory,
    this.imageUrl,
    this.hasBorder = false,
    this.isNew = false,
    this.isSaved = false,
    this.onSaveTap,
    required this.text,
    super.key,
  }) {
    gallery = false;
  }

  AdviceCard.withGallery({
    required this.advicesCategory,
    this.imageUrl,
    this.hasBorder = false,
    this.isNew = false,
    this.isSaved = false,
    this.onSaveTap,
    required this.text,
    super.key,
  }) {
    timer = null;
    gallery = true;
  }

  final Color _topWidgetBgColor = ThemeColor.darkBlue.withOpacity(0.2);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: imageUrl == null ? ThemeColor.primary : Colors.transparent,
        image: imageUrl != null
            ? DecorationImage(
                image: NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: hasBorder
            ? Border.all(
                width: 4,
                color: Colors.white,
              )
            : null,
      ),
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 16,
        left: 8,
        right: 8,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _categoryIcon,
              _topCenterWidget,
              AdviceCardSaveButton(
                isSaved: isSaved,
                onTap: onSaveTap,
              ),
            ],
          ),
          _bottomSection(context)
        ],
      ),
    );
  }

  Widget _newBox(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 1,
      ),
      child: const LabelSmall(
        'NEW',
        fontWeight: FontWeight.bold,
      ).applyShaders(context),
    );
  }

  Widget _bottomSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: isNew,
          child: _newBox(context),
        ),
        ThemeSizedBox.height4,
        TitleSmall(
          text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget get _categoryIcon {
    //temp solution
    return CircleAvatar(
      backgroundColor: advicesCategory.categoryColor,
      radius: 14,
      child: SvgPicture.asset(
        advicesCategory.iconPath,
        color: Colors.white,
      ),
    );
  }

  Widget get _topCenterWidget {
    if (timer != null) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          color: _topWidgetBgColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(90),
          ),
        ),
        child: BodySmall(timer ?? ''),
      );
    }
    if (gallery == true) {
      return CircleAvatar(
        backgroundColor: _topWidgetBgColor,
        radius: 12,
        child: SvgPicture.asset(ThemeIcon.gallery),
      );
    }
    return const SizedBox.shrink();
  }
}
