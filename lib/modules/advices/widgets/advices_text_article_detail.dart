import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lines/core/app_theme.dart';
import 'package:lines/data/models/advices_category.dart';
import 'package:lines/widgets/layouts/app_scaffold_page.dart';

import '../../../data/models/advices_article.dart';

class AdvicesTextArticleDetails extends StatelessWidget {
  final AdvicesArticle article;
  final AdvicesCategory category;

  const AdvicesTextArticleDetails({
    required this.article,
    required this.category,
    super.key,
  });

  static Color dividerColor = const Color(0x194b399c);

  @override
  Widget build(BuildContext context) {
    AdvicesCategory categoryFromArticle = AdvicesCategory.fromIconName(
      article.iconName,
    );

    return AppScaffoldPage(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 32,
              ),
              children: [
                const SizedBox(
                  height: 260,
                ),
                ThemeSizedBox.height32,
                CircleAvatar(
                  backgroundColor: categoryFromArticle.categoryColor,
                  child: SvgPicture.asset(
                    categoryFromArticle.iconPath,
                    color: Colors.white,
                  ),
                ),
                TitleMedium(
                  category.categoryTitle != null
                      ? category.categoryTitle!.toUpperCase()
                      : "",
                  color: ThemeColor.darkBlue,
                  textAlign: TextAlign.center,
                ),
                ThemeSizedBox.height4,
                DisplayMedium(
                  article.title,
                  textAlign: TextAlign.center,
                ).applyShaders(context),
                ThemeSizedBox.height16,
                BodyLarge(
                  article.shortDescription ?? "",
                  color: ThemeColor.darkBlue,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w500,
                ),
                ThemeSizedBox.height48,
                Divider(
                  color: dividerColor,
                ),
                ThemeSizedBox.height48,
                Html(
                  data: article.text,
                ),
              ],
            ),
            SizedBox(
              height: 260,
              child: _topBar(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: article.thumbImageUrl?.isNotEmpty == true
            ? DecorationImage(
                image: NetworkImage(
                  article.thumbImageUrl!,
                ),
                fit: BoxFit.cover,
              )
            : null,
        color: article.thumbImageUrl?.isEmpty == true
            ? ThemeColor.primary
            : Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                ThemeIcon.back,
                color: ThemeColor.darkBlue,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  ThemeIcon.shareGradient,
                ),
              ),
              ThemeSizedBox.width8,
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  ThemeIcon.savedEmptyGradient,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
