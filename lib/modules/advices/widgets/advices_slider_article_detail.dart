import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/app_theme.dart';
import '../../../data/models/advices_article.dart';
import '../../../data/models/advices_category.dart';
import '../../../widgets/appbar/transparent_app_bar.dart';
import '../../../widgets/layouts/app_scaffold_page.dart';

class AdvicesSliderArticleDetail extends StatefulWidget {
  final AdvicesArticle article;
  final AdvicesCategory category;

  const AdvicesSliderArticleDetail({
    required this.article,
    required this.category,
    super.key,
  });

  @override
  State<AdvicesSliderArticleDetail> createState() =>
      _AdvicesSliderArticleDetailState();
}

class _AdvicesSliderArticleDetailState
    extends State<AdvicesSliderArticleDetail> {
  static const Color _unselectedDotColor = Color(0x194b399c);
  static const Color _disclaimerColor = Color(0x7f1f2d4f);
  int _current = 0;

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
          SvgPicture.asset(
            ThemeIcon.savedEmpty,
            color: ThemeColor.darkBlue,
          ),
        ],
        backButtonColor: ThemeColor.darkBlue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: widget.category.categoryColor,
              child: SvgPicture.asset(
                widget.category.iconPath,
                color: Colors.white,
              ),
            ),
            ThemeSizedBox.height8,
            TitleMedium(
              widget.category.categoryTitle != null
                  ? widget.category.categoryTitle!.toUpperCase()
                  : "",
              color: ThemeColor.darkBlue,
              textAlign: TextAlign.center,
            ),
            ThemeSizedBox.height4,
            DisplayMedium(
              widget.article.title,
              textAlign: TextAlign.center,
            ).applyShaders(context),
            ThemeSizedBox.height40,
            Visibility(
              visible: widget.article.slideshowImageUrls?.isNotEmpty == true,
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
                    setState(
                      () {
                        _current = value;
                      },
                    );
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
                      color: _current == entry.key
                          ? Colors.black
                          : _unselectedDotColor,
                    ),
                  );
                },
              ).toList(),
            ),
            ThemeSizedBox.height40,
            LabelLarge(
              widget.article.disclaimer ?? "",
              color: _disclaimerColor,
              fontWeight: FontWeight.w500,
            ),
            ThemeSizedBox.height60,
          ],
        ),
      ),
    );
  }

  List<Widget> get images => List.generate(
        widget.article.slideshowImageUrls!.length,
        (index) {
          return Image.network(
            widget.article.slideshowImageUrls![index],
            fit: BoxFit.cover,
          );
        },
      );
}
