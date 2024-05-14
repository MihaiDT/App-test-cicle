import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/advices_article.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/modules/advices/widgets/suggested_article_section.dart';
import 'package:lines/widgets/appbar/transparent_app_bar.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

class AdvicesSliderArticleDetail extends StatelessWidget {
  final AdvicesCategory? category;

  final AdvicesArticle? article;
  final List<Widget> images;

  final bool isArticleFav;

  final Function(bool isFav) onFavChanged;
  final Function(int value) onSlideChanged;

  final int currentSlide;

  const AdvicesSliderArticleDetail({
    required this.category,
    required this.article,
    required this.images,
    required this.isArticleFav,
    required this.currentSlide,
    required this.onFavChanged,
    required this.onSlideChanged,
    super.key,
  });

  static const Color _unselectedDotColor = Color(0x194b399c);
  static const Color _disclaimerColor = Color(0x7f1f2d4f);

  @override
  Widget build(BuildContext context) {
    return AppScaffoldPage(
      backgroundColor: Colors.white,
      appBar: TransparentAppBar(
        actions: [
          SvgPicture.asset(
            ThemeIcon.shareGradient,
            color: ThemeColor.darkBlue,
          ),
          ThemeSizedBox.width24,
          InkWell(
            onTap: () {
              onFavChanged(!isArticleFav);
            },
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                isArticleFav ? ThemeIcon.savedFilled : ThemeIcon.savedEmpty,
                color: ThemeColor.darkBlue,
              ),
            ),
          ),
        ],
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: category?.categoryColor,
                child: SvgPicture.asset(
                  category?.iconPath ?? "",
                  color: Colors.white,
                ),
              ),
              ThemeSizedBox.height8,
              TitleMedium(
                category?.categoryTitle?.toUpperCase() ?? "",
                color: ThemeColor.darkBlue,
                textAlign: TextAlign.center,
              ),
              ThemeSizedBox.height4,
              DisplayMedium(
                article?.title ?? "",
                textAlign: TextAlign.center,
              ).applyShaders(context),
              ThemeSizedBox.height40,
              Visibility(
                visible: article?.slideshowImageUrls?.isNotEmpty == true,
                child: Container(
                  height: 500,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: PageView(
                    onPageChanged: (value) {
                      onSlideChanged(value);
                    },
                    clipBehavior: Clip.hardEdge,
                    children: images,
                  ),
                ),
              ),
              ThemeSizedBox.height16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map(
                  (entry) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentSlide == entry.key
                            ? Colors.black
                            : _unselectedDotColor,
                      ),
                    );
                  },
                ).toList(),
              ),
              ThemeSizedBox.height40,
              LabelLarge(
                article?.disclaimer ?? "",
                color: _disclaimerColor,
                fontWeight: FontWeight.w500,
              ),
              ThemeSizedBox.height60,
            ],
          ),
          const SuggestedArticleSection(),
        ],
      ),
    );
  }
}
