import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/advices/widgets/advice_card_save_button.dart';

class AdviceCard extends StatelessWidget {
  final AdvicesArticle article;
  final bool hasBorder;
  final Function(bool)? onSaveTap;
  final Function(AdvicesArticle, AdvicesCategory)? onCardTap;

  late final String? timer;
  late final bool gallery;

  AdviceCard({
    required this.article,
    this.hasBorder = false,
    this.onSaveTap,
    this.onCardTap,
    super.key,
  }) {
    switch (article.typology) {
      case ArticleType.text:
        timer = null;
        gallery = false;
      case ArticleType.slider:
        timer = null;
        gallery = true;
      case ArticleType.video:
        gallery = false;
        timer = "";
    }
  }

  final Color _topWidgetBgColor = ThemeColor.darkBlue.withOpacity(0.2);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onCardTap != null) {
          onCardTap!(
            article,
            article.getParentCategory,
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: article.thumbImageUrl == null ? ThemeColor.primary : Colors.transparent,
          image: article.thumbImageUrl?.isNotEmpty == true
              ? DecorationImage(
                  image: NetworkImage(
                    article.thumbImageUrl!,
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.darken,
                  ),
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
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      ThemeImage.articleShadow,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
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
                        isSaved: article.isFavorite,
                        onTap: onSaveTap,
                      ),
                    ],
                  ),
                  _bottomSection(context),
                ],
              ),
            ),
          ],
        ),
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
          visible: article.isNew,
          child: _newBox(context),
        ),
        ThemeSizedBox.height4,
        Align(
          alignment: Alignment.bottomLeft,
          child: TitleSmall(
            article.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  Widget get _categoryIcon {
    //temp solution
    return CircleAvatar(
      backgroundColor: article.getParentCategory.categoryColor,
      radius: 14,
      child: SvgPicture.asset(
        article.getParentCategory.iconPath,
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
